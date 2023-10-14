part of 'home_bloc.dart';

@immutable
abstract class HomeScreenEvent {}

class DeviceListEvent extends HomeScreenEvent {}

class DeviceStateEvent extends HomeScreenEvent {
  final int deviceId;
  final int state;

  DeviceStateEvent(this.deviceId, this.state);
}

class NavigateToDeviceDetailEvent extends HomeScreenEvent {
  final DeviceInfoModel deviceInfoModel;

  NavigateToDeviceDetailEvent(this.deviceInfoModel);
}
