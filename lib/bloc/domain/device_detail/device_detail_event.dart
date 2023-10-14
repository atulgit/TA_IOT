part of 'device_detail_bloc.dart';

@immutable
abstract class DeviceDetailEvent extends Equatable {}

class DeviceDetail extends DeviceDetailEvent {
  final int deviceId;

  DeviceDetail(this.deviceId);

  @override
  List<Object?> get props => [deviceId];
}

class ChangeACModeEvent extends DeviceDetailEvent {
  final int deviceId;
  final AirConditionerModes mode;

  ChangeACModeEvent(this.deviceId, this.mode);

  @override
  List<Object?> get props => [deviceId, mode];
}

class TVPictureModeChangedEvent extends DeviceDetailEvent {
  final int deviceId;

  TVPictureModeChangedEvent(this.deviceId);

  @override
  List<Object?> get props => [deviceId];
}
