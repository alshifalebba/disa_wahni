import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginpage/features/home/data/model/checkin_model.dart';
import 'package:loginpage/features/home/domain/repository/checkin_rep.dart';

part 'checkin_bloc.freezed.dart';
part 'checkin_event.dart';
part 'checkin_state.dart';

class CheckinBloc extends Bloc<CheckinEvent, CheckinState> {
  final ImagePicker picker = ImagePicker();
  final CheckinRepository repository;

  CheckinBloc(this.repository) : super(const CheckinState()) {
    on<_CaptureSelfie>(_captureSelfie);
    on<_CaptureOdometer>(_captureOdometer);
    on<_Submit>(_onSubmit);
    on<_Reset>(_onReset);
  }

  Future<void> _captureSelfie(
    _CaptureSelfie event,
    Emitter<CheckinState> emit,
  ) async {
    final image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (image != null) {
      emit(state.copyWith(selfieImage: image));
    }
  }

  Future<void> _captureOdometer(
    _CaptureOdometer event,
    Emitter<CheckinState> emit,
  ) async {
    final image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (image != null) {
      emit(state.copyWith(odometerImage: image));
    }
  }

  Future<void> _onSubmit(_Submit event, Emitter<CheckinState> emit) async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, successMessage: null),
    );

    try {
      if (state.selfieImage == null) {
        throw Exception("Please capture selfie.");
      }

      if (state.odometerImage == null) {
        throw Exception("Please capture odometer image.");
      }

      final location = await repository.getLocation();

      final request = CheckinRequest(
        logType: event.logType,
        odometerValue: event.odometerValue,
        latitude: location.latitude,
        longitude: location.longitude,
        selfieImage: File(state.selfieImage!.path),
        odometerImage: File(state.odometerImage!.path),
      );

      await repository.submit(request);

      emit(
        state.copyWith(
          isLoading: false,
          successMessage: event.logType == "IN"
              ? "Check-In Submitted Successfully"
              : "Check-Out Submitted Successfully",
          selfieImage: null,
          odometerImage: null,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void _onReset(_Reset event, Emitter<CheckinState> emit) {
    emit(const CheckinState());
  }
}
