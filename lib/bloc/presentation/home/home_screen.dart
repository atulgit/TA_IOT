import 'package:TA_IOT/bloc/data/model/device_category.dart';
import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/data/repository/device_detail_repository.dart';
import 'package:TA_IOT/bloc/domain/device_detail/device_detail_bloc.dart';
import 'package:TA_IOT/bloc/domain/home/home_bloc.dart';
import 'package:TA_IOT/bloc/presentation/common/styles/DeviceItemStyle.dart';
import 'package:TA_IOT/bloc/presentation/common/utils/AppAssets.dart';
import 'package:TA_IOT/bloc/presentation/device_detail/device_detail_screen.dart';
import 'package:TA_IOT/bloc/presentation/home/widgets/CategoryListWidget.dart';
import 'package:TA_IOT/bloc/presentation/home/widgets/CategoryWidget.dart';
import 'package:TA_IOT/bloc/presentation/home/widgets/DeviceItemWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/utils/Strings.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeScreen> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  late final DeviceDetailRepository deviceDetailRepository;
  late final HomeBloc homeBloc;
  double deviceItemHeight = 250;
  final String header = Strings.header_my_devices;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: _getBody()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    deviceDetailRepository = DeviceDetailRepository();
    homeBloc = HomeBloc(deviceDetailRepository, _navigatorKey);
    homeBloc.add(DeviceListEvent());
  }

  Widget _getBody() {
    return BlocProvider<HomeBloc>(
        create: (context) => homeBloc,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 10, right: 20, top: 20, bottom: 10),
              child: Text(header, style: TextStyle(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.bold))),
          CategoryListWidget(),
          BlocBuilder(
            bloc: homeBloc,
            builder: (BuildContext context, HomeScreenState state) {
              if (state is DeviceListLoading) {
                return CircularProgressIndicator();
              } else if (state is DeviceListLoaded) {
                return _getDeviceListWidget(state.deviceList);
              } else if (state is DeviceListError) {
                return Text('Unable to fetch the device details!!!', style: TextStyle(color: Colors.black54));
              } else {
                return Container();
              }
            },
            buildWhen: (context, state) {
              if (state is DeviceListLoaded) return true;
              return false;
            },
          )
        ]));
  }

  Widget _getDeviceListWidget(List<DeviceInfoModel> deviceList) {
    return SingleChildScrollView(
        child: GridView.builder(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .8,
            ),
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: deviceList.length,
            itemBuilder: (BuildContext context, int index) {
              var deviceItem = deviceList[index];
              return InkWell(
                  child: _getDeviceItem(deviceItem),
                  onTap: () {
                    //homeBloc.add(NavigateToDeviceDetailEvent(deviceItem));

                    Navigator.push(
                        context,
                        MaterialPageRoute<DeviceDetailScreen>(
                          settings: const RouteSettings(name: "/home"),
                          builder: (_) => DeviceDetailScreen(
                            deviceInfoModel: deviceItem,
                          ),
                        ));
                  });
            }));
  }

  Widget _getDeviceItem(DeviceInfoModel deviceInfoModel) {
    switch (deviceInfoModel.deviceCategory.categoryType) {
      case DeviceCategoryType.AC:
        return _getACDevice(deviceInfoModel);

      case DeviceCategoryType.SMART_DOOR:
        return _getSmartDoorDevice(deviceInfoModel);

      case DeviceCategoryType.TV:
        return _getTVDevice(deviceInfoModel);

      default:
        return Container();
    }
  }

  Widget _getACDevice(DeviceInfoModel deviceInfoModel) {
    return DeviceItemWidget(
      deviceItemHeight: deviceItemHeight,
      deviceInfoModel: deviceInfoModel,
      homeBloc: homeBloc,
    );
  }

  Widget _getTVDevice(DeviceInfoModel deviceInfoModel) {
    return DeviceItemWidget(
      deviceItemHeight: deviceItemHeight,
      deviceInfoModel: deviceInfoModel,
      homeBloc: homeBloc,
    );
  }

  Widget _getSmartDoorDevice(DeviceInfoModel deviceInfoModel) {
    return DeviceItemWidget(
      deviceItemHeight: deviceItemHeight,
      deviceInfoModel: deviceInfoModel,
      homeBloc: homeBloc,
    );
  }
}
