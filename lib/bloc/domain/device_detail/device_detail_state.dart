part of 'device_detail_bloc.dart';

@immutable
abstract class DeviceDetailState {}

class DeviceDetailLoaded extends DeviceDetailState {
  late DeviceInfoModel deviceDetail;

  DeviceDetailLoaded(this.deviceDetail);
}

class DeviceDetailLoading extends DeviceDetailState {}

class DeviceDetailError extends DeviceDetailState {}
