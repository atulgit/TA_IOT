import 'package:ta_iot/bloc/data/model/dashboard_model.dart';
import 'package:ta_iot/bloc/data/model/device_category_model.dart';
import 'package:ta_iot/bloc/data/model/device_model.dart';
import 'package:ta_iot/bloc/data/repository/abstract_repository.dart';
import 'package:ta_iot/bloc/data/repository/device_detail_repository.dart';
import 'package:ta_iot/bloc/domain/device_detail/device_detail_bloc.dart';
import 'package:ta_iot/bloc/domain/home/home_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'mock_repository.dart';

void main() {
  //Mock Repository
  final AbstractRepository _mockRepository = MockDeviceDetailRepository();
  late DashboardModel _mockDashboardModel;

  List<DeviceInfoModel> _mockDevices = [];

  //Initialize mock data for IOT devices.
  setUp(() async {
    _mockDevices = await _mockRepository.getDeviceList();
    _mockDashboardModel = await _mockRepository.getDashboardParams();
  });

  //HOME SCREEN TESTS
  group('Home Screen Tests', () {
    blocTest<HomeBloc, HomeScreenState>("Device List Loaded",
        build: () => HomeBloc(_mockRepository, GlobalKey()),
        act: (bloc) => bloc.add(DeviceListEvent()),
        expect: () => contains(DeviceListLoaded(_mockDevices)));

    blocTest<HomeBloc, HomeScreenState>("Dashboard Loaded",
        build: () => HomeBloc(_mockRepository, GlobalKey()),
        act: (bloc) => bloc.add(DashboardInfoEvent()),
        expect: () => contains(DashboardInfoLoadedState(_mockDashboardModel)));
  });

  DeviceInfoModel _mockDeviceDetail = DeviceInfoModel(
      1, DeviceCategoryModel(DeviceCategoryType.AC, "Air Conditioner", ""), "", "assets/images/ac_icon.png", "LG 101", 0, 12,
      airConditioner: AirConditionerModel(AirConditionerModes.Cool, 80, 24));

  //IOT DEVICE DETAIL SCREEN TESTS
  group('Device Detail Screen Tests', () {
    blocTest<DeviceDetailBloc, DeviceDetailState>("Device Detail Loaded",
        build: () => DeviceDetailBloc(DeviceDetailRepository()),
        act: (bloc) => bloc.add(DeviceDetail(1)),
        expect: () => contains(DeviceDetailLoadedState(_mockDeviceDetail)));

    blocTest<DeviceDetailBloc, DeviceDetailState>("Device AC Detail Loaded",
        build: () => DeviceDetailBloc(_mockRepository),
        act: (bloc) {
          bloc.add(DeviceDetail(1));
        },
        expect: () {
          return DeviceMatcher((item) {
            var deviceDetail = (item[1] as DeviceDetailLoadedState).deviceDetail;
            return deviceDetail.airConditioner != null;
          });
        });

    blocTest<DeviceDetailBloc, DeviceDetailState>("Device Detail State Sequence",
        build: () => DeviceDetailBloc(_mockRepository),
        act: (bloc) => bloc.add(DeviceDetail(1)),
        expect: () => [isA<DeviceDetailLoading>(), isA<DeviceDetailLoadedState>()]);
  });
}

//CUSTOM MATCHER
class DeviceMatcher extends Matcher {
  final bool Function(dynamic) validate;

  DeviceMatcher(this.validate);

  @override
  Description describe(Description description) {
    description.add("Device Matcher");
    return description;
  }

  @override
  bool matches(item, Map matchState) {
    return validate(item);
  }
}
