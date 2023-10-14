part of 'device_detail_bloc.dart';

@immutable
abstract class DeviceDetailState {}

class DeviceDetailLoadedState extends DeviceDetailState {
  late DeviceInfoModel deviceDetail;

  DeviceDetailLoadedState(this.deviceDetail);
}

class ACModeChangedState extends DeviceDetailState {
  final DeviceInfoModel deviceInfoModel;

  ACModeChangedState(this.deviceInfoModel);
}

class DeviceDetailLoading extends DeviceDetailState {}

class DeviceDetailError extends DeviceDetailState {}

class TVPictureModeChangedState extends DeviceDetailState {
  late DeviceInfoModel deviceDetail;

  TVPictureModeChangedState(this.deviceDetail);
}
