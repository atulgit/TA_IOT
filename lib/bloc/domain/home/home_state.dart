part of 'home_bloc.dart';

@immutable
abstract class HomeScreenState extends Equatable {}

class DeviceListLoaded extends HomeScreenState {
  List<DeviceInfoModel> deviceList = [];

  DeviceListLoaded(this.deviceList);

  @override
  List<Object> get props => [deviceList];

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

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DeviceStateChanged extends HomeScreenState {
  List<DeviceInfoModel> deviceList = [];

  DeviceStateChanged(this.deviceList);

  @override
  List<Object> get props => [deviceList];

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

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
