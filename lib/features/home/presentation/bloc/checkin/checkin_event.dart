part of 'checkin_bloc.dart';

@freezed
class CheckinEvent with _$CheckinEvent {
  const factory CheckinEvent.captureSelfie() = _CaptureSelfie;

  const factory CheckinEvent.captureOdometer() = _CaptureOdometer;

  const factory CheckinEvent.submit({
    required String logType,
    required String odometerValue,
  }) = _Submit;

  const factory CheckinEvent.reset() = _Reset;
}