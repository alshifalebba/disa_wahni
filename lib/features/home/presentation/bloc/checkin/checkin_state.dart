part of 'checkin_bloc.dart';

@freezed
abstract class CheckinState with _$CheckinState {
  const factory CheckinState({
    @Default(false) bool isLoading,
    XFile? selfieImage,
    XFile? odometerImage,
    String? errorMessage,
    String? successMessage,
  }) = _CheckinState;
}