part of 'vehicle_bloc.dart';

@freezed
abstract class VehicleState with _$VehicleState {
  const factory VehicleState({
    @Default(false) bool isLoading,
    @Default([]) List<String> vehicles,
    String? errorMessage,
  }) = _VehicleState;
}