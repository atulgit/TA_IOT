import 'package:ta_iot/bloc/data/model/device_category_model.dart';
import 'package:ta_iot/bloc/data/model/device_model.dart';
import 'package:ta_iot/bloc/data/repository/device_detail_repository.dart';
import 'package:ta_iot/bloc/domain/home/home_bloc.dart';
import 'package:ta_iot/bloc/presentation/common/routes/routes.dart';
import 'package:ta_iot/bloc/presentation/common/styles/text_styles.dart';
import 'package:ta_iot/bloc/presentation/home/widgets/category_list_widget.dart';
import 'package:ta_iot/bloc/presentation/home/widgets/dashboard_widget.dart';
import 'package:ta_iot/bloc/presentation/home/widgets/device_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/utils/strings.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeScreen> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  late final DeviceDetailRepository _deviceDetailRepository;
  late final HomeBloc _homeBloc;
  double _deviceItemHeight = 0;
  final String _header = Strings.headerMyDevices;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: _getBody()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _deviceDetailRepository = DeviceDetailRepository();
    _homeBloc = HomeBloc(_deviceDetailRepository, _navigatorKey);
    _homeBloc.add(DashboardInfoEvent());
    _homeBloc.add(DeviceListEvent());
  }

  Widget _getBody() {
    return BlocProvider<HomeBloc>(
        create: (context) => _homeBloc,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(padding: EdgeInsets.only(left: 10, right: 20, top: 20, bottom: 10), child: Text(_header, style: HomeStyles.headerStyle)),
          DashboardWidget(),
          CategoryListWidget(),
          Container(
              margin: EdgeInsets.only(top: 10),
              child: BlocBuilder(
                bloc: _homeBloc,
                builder: (BuildContext context, HomeScreenState state) {
                  if (state is DeviceListLoading) {
                    return CircularProgressIndicator();
                  } else if (state is DeviceListLoaded) {
                    return _getDeviceListWidget(state.deviceList);
                  } else if (state is DeviceListError) {
                    return Text(Strings.errorMessage, style: TextStyle(color: Colors.black54));
                  } else {
                    return Container();
                  }
                },
                buildWhen: (context, state) {
                  if (state is DeviceListLoaded) return true;
                  return false;
                },
              ))
        ]));
  }

  Widget _getDeviceListWidget(List<DeviceInfoModel> deviceList) {
    return SizedBox(
        height: MediaQuery.of(context).size.width * 0.70,
        child: SingleChildScrollView(
            child: GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .95,
                ),
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: deviceList.length,
                itemBuilder: (BuildContext context, int index) {
                  var deviceItem = deviceList[index];
                  return InkWell(
                      child: _getDeviceItem(deviceItem),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.deviceDetail, arguments: deviceItem);

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute<DeviceDetailScreen>(
                        //       settings: const RouteSettings(name: "/home"),
                        //       builder: (_) => DeviceDetailScreen(
                        //         deviceInfoModel: deviceItem,
                        //       ),
                        //     ));
                      });
                })));
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
      deviceItemHeight: _deviceItemHeight,
      deviceInfoModel: deviceInfoModel,
      homeBloc: _homeBloc,
    );
  }

  Widget _getTVDevice(DeviceInfoModel deviceInfoModel) {
    return DeviceItemWidget(
      deviceItemHeight: _deviceItemHeight,
      deviceInfoModel: deviceInfoModel,
      homeBloc: _homeBloc,
    );
  }

  Widget _getSmartDoorDevice(DeviceInfoModel deviceInfoModel) {
    return DeviceItemWidget(
      deviceItemHeight: _deviceItemHeight,
      deviceInfoModel: deviceInfoModel,
      homeBloc: _homeBloc,
    );
  }
}
