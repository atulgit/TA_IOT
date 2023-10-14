import 'package:TA_IOT/bloc/presentation/home/widgets/DeviceItemIconWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/device_model.dart';
import '../../../domain/home/home_bloc.dart';
import '../../common/styles/DeviceItemStyle.dart';
import 'DeviceEnergyWidget.dart';
import 'DeviceItemTextWidget.dart';

class DeviceItemWidget extends StatefulWidget {
  final DeviceInfoModel deviceInfoModel;
  final double deviceItemHeight;
  final HomeBloc homeBloc;

  DeviceItemWidget({Key? key, required this.deviceInfoModel, required this.deviceItemHeight, required this.homeBloc}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DeviceItemWidgetState(deviceInfoModel: deviceInfoModel, deviceItemHeight: deviceItemHeight);
  }
}

class DeviceItemWidgetState extends State<DeviceItemWidget> {
  late DeviceInfoModel deviceInfoModel;
  final double deviceItemHeight;
  bool isSwitchedOn = false;
  late final HomeBloc homeBloc;

  DeviceItemWidgetState({
    Key? key,
    required this.deviceInfoModel,
    required this.deviceItemHeight,
  });

  @override
  void initState() {
    super.initState();
    isSwitchedOn = deviceInfoModel.deviceState == 1 ? true : false;
    homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: homeBloc,
        builder: (context, state) {
          if (state is DeviceListLoaded) {
            return _getDeviceItemWidget();
          } else if (state is DeviceStateChanged) {
            deviceInfoModel = state.deviceInfoModel;
            return _getDeviceItemWidget();
          } else {
            return Container();
          }
        },
        buildWhen: (context, state) {
          if (state is DeviceListLoaded) return true;
          if (state is DeviceStateChanged && deviceInfoModel.deviceId == state.deviceInfoModel.deviceId) {
            return true;
          }
          return false;
        });
  }

  Widget _getDeviceItemWidget() {
    return Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            DeviceItemIconWidget(path: deviceInfoModel.deviceImagePath),
            Switch(
              value: isSwitchedOn,
              onChanged: (value) {
                widget.homeBloc.add(DeviceStateEvent(deviceInfoModel.deviceId, value ? 1 : 0));
                isSwitchedOn = value;
              },
            )
          ]),
          const SizedBox(
            height: 10,
          ),
          DeviceItemWidgetText(deviceInfoModel: deviceInfoModel),
          const SizedBox(
            height: 20,
          ),
          DeviceEnergyWidget(deviceInfoModel: deviceInfoModel)
        ]),
        height: deviceItemHeight,
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        decoration: CommonStyle.getDeviceItemDecorator());
  }
}
