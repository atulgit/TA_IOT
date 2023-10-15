part of 'home_bloc.dart';

@immutable
abstract class HomeScreenEvent extends Equatable {}

class DeviceListEvent extends HomeScreenEvent {
  @override
  List<Object?> get props => [];

}

class DeviceStateEvent extends HomeScreenEvent {
  final int deviceId;
  final int state;

  DeviceStateEvent(this.deviceId, this.state);

  @override
  List<Object?> get props => [];
}

class NavigateToDeviceDetailEvent extends HomeScreenEvent {
  final DeviceInfoModel deviceInfoModel;

  NavigateToDeviceDetailEvent(this.deviceInfoModel);

  @override
  List<Object?> get props => [];
}

class DashboardInfoEvent extends HomeScreenEvent {
  @override
  List<Object?> get props => [];
}

class CategorySelectedEvent extends HomeScreenEvent {
  final DeviceCategoryType categoryType;

  CategorySelectedEvent(this.categoryType);

  @override
  List<Object?> get props => [];
}
