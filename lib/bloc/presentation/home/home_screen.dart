import 'package:TA_IOT/bloc/data/model/device_category.dart';
import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/data/repository/device_detail_repository.dart';
import 'package:TA_IOT/bloc/domain/device_detail/device_detail_bloc.dart';
import 'package:TA_IOT/bloc/domain/home/home_bloc.dart';
import 'package:TA_IOT/bloc/presentation/common/styles/DeviceItemStyle.dart';
import 'package:TA_IOT/bloc/presentation/home/widgets/DeviceItemWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeScreen> {
  late final DeviceDetailRepository deviceDetailRepository;
  late final HomeBloc homeBloc;
  double deviceItemHeight = 250;
  final String header = "My Devices";

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: _getBody()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    deviceDetailRepository = DeviceDetailRepository();
    homeBloc = HomeBloc(deviceDetailRepository);
    homeBloc.add(DeviceList());
  }

  Widget _getBody() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: EdgeInsets.all(20), child: Text(header, style: TextStyle(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.bold))),
      BlocBuilder(
          bloc: homeBloc,
          builder: (BuildContext context, HomeScreenState state) {
            if (state is DeviceListLoading) {
              return CircularProgressIndicator();
            } else if (state is DeviceListLoaded) {
              return SingleChildScrollView(
                  child: GridView.builder(
                      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .8,
                      ),
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: state.deviceList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var deviceItem = state.deviceList[index];
                        return _getDeviceItem(deviceItem);
                      }));
            } else if (state is DeviceListError) {
              return Text('Unable to fetch the user details!!!', style: TextStyle(color: Colors.black54));
            } else {
              return Container();
            }
          })
    ]);
  }

  Widget _getDeviceItem(DeviceInfoModel deviceInfoModel) {
    switch (deviceInfoModel.deviceCategory.categoryType) {
      case DeviceCategoryType.AC:
        return _getACDevice(deviceInfoModel);

      case DeviceCategoryType.SMART_DOOR:
        return _getSmartDoorDevice(deviceInfoModel);

      case DeviceCategoryType.TV:
        return _getTVDevice(deviceInfoModel);
    }
  }

  Widget _getACDevice(DeviceInfoModel deviceInfoModel) {
    return DeviceItemWidget(
      deviceItemHeight: deviceItemHeight,
      deviceInfoModel: deviceInfoModel,
    );
  }

  Widget _getTVDevice(DeviceInfoModel deviceInfoModel) {
    return DeviceItemWidget(
      deviceItemHeight: deviceItemHeight,
      deviceInfoModel: deviceInfoModel,
    );
  }

  Widget _getSmartDoorDevice(DeviceInfoModel deviceInfoModel) {
    return DeviceItemWidget(
      deviceItemHeight: deviceItemHeight,
      deviceInfoModel: deviceInfoModel,
    );
  }
}