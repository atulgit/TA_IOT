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

class TVSoundModeChangedEvent extends DeviceDetailEvent {
  final int deviceId;

  TVSoundModeChangedEvent(this.deviceId);

  @override
  List<Object?> get props => [deviceId];
}

class ACTemperatureChangeEvent extends DeviceDetailEvent {
  final String increaseOrDecrease;
  final int deviceId;

  ACTemperatureChangeEvent(this.increaseOrDecrease, this.deviceId);

  @override
  List<Object?> get props => [increaseOrDecrease, deviceId];
}

class TVVolumeEvent extends DeviceDetailEvent {
  final bool isMute = false;

  @override
  List<Object?> get props => [isMute];
}
