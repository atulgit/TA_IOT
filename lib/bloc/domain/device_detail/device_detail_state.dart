part of 'device_detail_bloc.dart';

@immutable
abstract class DeviceDetailState extends Equatable {}

class DeviceDetailLoadedState extends DeviceDetailState {
  late DeviceInfoModel deviceDetail;

  DeviceDetailLoadedState(this.deviceDetail);

  @override
  List<Object?> get props => [deviceDetail];
}

class ACModeChangedState extends DeviceDetailState {
  final DeviceInfoModel deviceInfoModel;

  ACModeChangedState(this.deviceInfoModel);

  @override
  List<Object?> get props => [deviceInfoModel];
}

class DeviceDetailLoading extends DeviceDetailState {
  @override
  List<Object?> get props => [];
}

class DeviceDetailError extends DeviceDetailState {
  @override
  List<Object?> get props => [];
}

class TVPictureModeChangedState extends DeviceDetailState {
  late DeviceInfoModel deviceDetail;

  TVPictureModeChangedState(this.deviceDetail);

  @override
  List<Object?> get props => [deviceDetail];
}

class TVSoundModeChangedState extends DeviceDetailState {
  final DeviceInfoModel deviceDetail;

  TVSoundModeChangedState(this.deviceDetail);

  @override
  List<Object?> get props => [deviceDetail];
}

class ACTemperatureChangeState extends DeviceDetailState {
  final DeviceInfoModel deviceDetail;

  ACTemperatureChangeState(this.deviceDetail);

  @override
  List<Object?> get props => [deviceDetail];
}

class TVVolumeState extends DeviceDetailState {
  final bool isMute;

  TVVolumeState(this.isMute);

  @override
  List<Object?> get props => [isMute];
}
