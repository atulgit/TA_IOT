import 'dart:async';
import 'package:TA_IOT/bloc/data/model/dashboard_model.dart';
import 'package:TA_IOT/bloc/data/model/device_category.dart';
import 'package:TA_IOT/bloc/data/repository/abstract_repository.dart';
import 'package:TA_IOT/bloc/domain/home/use_cases/CategorySelectedUseCase.dart';
import 'package:TA_IOT/bloc/domain/home/use_cases/DeviceStateChangeUseCase.dart';
import 'package:TA_IOT/bloc/domain/home/use_cases/GetDashboardUseCase.dart';
import 'package:TA_IOT/bloc/domain/home/use_cases/GetDeviceListUseCase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:meta/meta.dart';
import '../../data/model/device_model.dart';
import '../../data/repository/device_detail_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  DeviceCategoryType selectedCategory = DeviceCategoryType.ALL;

  final GlobalKey<NavigatorState> navigatorKey;
  final AbstractRepository deviceDetailRepository;

  HomeBloc(this.deviceDetailRepository, this.navigatorKey) : super(DeviceListLoading());

  @override
  Stream<HomeScreenState> mapEventToState(event) async* {
    yield DeviceListLoading();
    try {
      if (event is DeviceListEvent) {
        var deviceList = await GetDeviceListUseCase(deviceDetailRepository).getDeviceList();
        yield DeviceListLoaded(deviceList);
      } else if (event is DeviceStateEvent) {
        var device = await DeviceStateChangeUseCase(deviceDetailRepository).setDeviceState(event.deviceId, event.state);
        emit(DeviceStateChanged(device));
      } else if (event is NavigateToDeviceDetailEvent) {
        // SchedulerBinding.instance.addPostFrameCallback((_) {
        //   navigatorKey.currentState?.pushNamed("device_detail", arguments: event.deviceInfoModel);
        // });
        // navigatorKey.currentState?.pushNamed("device_detail", arguments: event.deviceInfoModel);
      } else if (event is CategorySelectedEvent) {
        selectedCategory = event.categoryType;
        emit(CategorySelectedState());
        var deviceList = await CategorySelectedUseCase(deviceDetailRepository).setCategory(event.categoryType);
        emit(DeviceListLoaded(deviceList));
      } else if (event is DashboardInfoEvent) {
        var dashboardInfo = await GetDashboardUseCase(deviceDetailRepository).getDashboardInfo();
        emit(DashboardInfoLoadedState(dashboardInfo));
      }
    } catch (e) {
      yield DeviceListError();
    }
  }
}
