import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loginpage/domain/checkin/checkin_model.dart';
import 'package:loginpage/infrastructure/api_services/checkin_rep.dart';
import 'package:loginpage/infrastructure/database_functions/checkin_hivehelper.dart';

part 'checkin_bloc.freezed.dart';
part 'checkin_event.dart';
part 'checkin_state.dart';

class CheckinBloc extends Bloc<CheckinEvent, CheckinState> {
  final CheckinRepository repository;

  CheckinBloc(this.repository) : super(const CheckinState()) {
    on<_SelfieCaptured>(_onSelfieCaptured);
    on<_OdometerCaptured>(_onOdometerCaptured);
    on<_Submit>(_onSubmit);
    on<_Reset>(_onReset);
  }

  void _onSelfieCaptured(_SelfieCaptured event, Emitter<CheckinState> emit) {
    emit(state.copyWith(selfieImage: event.image));
  }

  void _onOdometerCaptured(
    _OdometerCaptured event,
    Emitter<CheckinState> emit,
  ) {
    emit(state.copyWith(odometerImage: event.image));
  }

  Future<void> _onSubmit(_Submit event, Emitter<CheckinState> emit) async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, successMessage: null),
    );

    try {
      /// Selfie is always required
      if (state.selfieImage == null) {
        throw Exception("Please capture selfie.");
      }

      /// Bike & Car require odometer
      if ((event.vehicleType == "Bike" || event.vehicleType == "Car") &&
          event.odometerValue.trim().isEmpty) {
        throw Exception("Please enter odometer value.");
      }

      /// Bike & Car require odometer image
      if ((event.vehicleType == "Bike" || event.vehicleType == "Car") &&
          state.odometerImage == null) {
        throw Exception("Please capture odometer image.");
      }

      final location = await repository.getLocation();

      log("========== CHECK IN ==========");
      log("Log Type : ${event.logType}");
      log("Vehicle  : ${event.vehicleType}");
      log("Latitude : ${location.latitude}");
      log("Longitude: ${location.longitude}");

      final request = CheckinRequest(
        logType: event.logType,
        odometerValue: event.odometerValue,
        latitude: location.latitude,
        longitude: location.longitude,
        selfieImage: File(state.selfieImage!.path),
        odometerImage: state.odometerImage != null
            ? File(state.odometerImage!.path)
            : null,
      );

      /// API CALL
      await repository.submit(request);

      /// SAVE TO HIVE
      if (event.logType == "IN") {
        await CheckinHiveHelper.saveCheckIn(
          vehicleType: event.vehicleType,
          odometerValue: event.odometerValue,
          odometerImage: state.odometerImage?.path,
        );
      } else {
        await CheckinHiveHelper.updateCheckOut();
      }

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
