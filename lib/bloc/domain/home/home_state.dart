part of 'home_bloc.dart';

@immutable
abstract class HomeScreenState extends Equatable {}

class DeviceListLoaded extends HomeScreenState {
  final List<DeviceInfoModel> deviceList;

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
  final DeviceInfoModel deviceInfoModel;

  DeviceStateChanged(this.deviceInfoModel);

  @override
  List<Object> get props => [deviceInfoModel];

  @override
  String toString() {
    return "";
  }
}

class CategorySelectedState extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class DashboardInfoLoadedState extends HomeScreenState{
  final DashboardModel dashboardModel;

  DashboardInfoLoadedState(this.dashboardModel);

  @override
  List<Object?> get props => [dashboardModel];
}

class DeviceListError extends HomeScreenState {
  @override
  String toString() {
    return "";
  }

  @override
  List<Object?> get props => [];
}
