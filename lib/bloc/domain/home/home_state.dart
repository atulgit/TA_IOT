part of 'home_bloc.dart';

@immutable
abstract class HomeScreenState {}

class DeviceListLoaded extends HomeScreenState {
  List<DeviceInfoModel> deviceList = [];

  DeviceListLoaded(this.deviceList);

  @override
  String toString() {
    return "";
  }
}

class DeviceListLoading extends HomeScreenState {
  @override
  String toString() {
    return "";
  }
}

class DeviceListError extends HomeScreenState {
  @override
  String toString() {
    return "";
  }
}
