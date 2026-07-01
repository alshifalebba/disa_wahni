import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loginpage/infrastructure/api_services/get_vehicle_rep.dart';

part 'vehicle_bloc.freezed.dart';
part 'vehicle_event.dart';
part 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final VehicleRepository repository;

  VehicleBloc(this.repository) : super(const VehicleState()) {
    on<_GetVehicleTypes>(_getVehicleTypes);
  }

  Future<void> _getVehicleTypes(
    _GetVehicleTypes event,
    Emitter<VehicleState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final vehicles = await repository.getVehicleTypes();

      emit(
        state.copyWith(
          isLoading: false,
          vehicles: vehicles,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}