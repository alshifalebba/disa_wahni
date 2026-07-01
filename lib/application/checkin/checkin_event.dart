part of 'checkin_bloc.dart';

@freezed
class CheckinEvent with _$CheckinEvent {
  const factory CheckinEvent.selfieCaptured(
    XFile image,
  ) = _SelfieCaptured;

  const factory CheckinEvent.odometerCaptured(
    XFile image,
  ) = _OdometerCaptured;

  const factory CheckinEvent.submit({
    required String logType,
    required String vehicleType,
    required String odometerValue,
  }) = _Submit;

  const factory CheckinEvent.reset() = _Reset;
}