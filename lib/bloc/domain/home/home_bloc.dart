import 'dart:async';
import 'package:ta_iot/bloc/data/model/dashboard_model.dart';
import 'package:ta_iot/bloc/data/model/device_category_model.dart';
import 'package:ta_iot/bloc/data/repository/abstract_repository.dart';
import 'package:ta_iot/bloc/domain/home/use_cases/category_selected_use_case.dart';
import 'package:ta_iot/bloc/domain/home/use_cases/device_state_change_use_case.dart';
import 'package:ta_iot/bloc/domain/home/use_cases/get_dashboard_use_case.dart';
import 'package:ta_iot/bloc/domain/home/use_cases/get_device_list_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/device_model.dart';

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
        yield(DeviceStateChanged(device));
      } else if (event is NavigateToDeviceDetailEvent) {
        // SchedulerBinding.instance.addPostFrameCallback((_) {
        //   navigatorKey.currentState?.pushNamed("device_detail", arguments: event.deviceInfoModel);
        // });
        // navigatorKey.currentState?.pushNamed("device_detail", arguments: event.deviceInfoModel);
      } else if (event is CategorySelectedEvent) {
        selectedCategory = event.categoryType;
        yield(CategorySelectedState());
        var deviceList = await CategorySelectedUseCase(deviceDetailRepository).setCategory(event.categoryType);
        yield(DeviceListLoaded(deviceList));
      } else if (event is DashboardInfoEvent) {
        var dashboardInfo = await GetDashboardUseCase(deviceDetailRepository).getDashboardInfo();
        yield(DashboardInfoLoadedState(dashboardInfo));
      }
    } catch (e) {
      yield DeviceListError();
    }
  }
}
