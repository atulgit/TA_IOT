import 'package:TA_IOT/bloc/presentation/home/widgets/DeviceItemIconWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/model/device_model.dart';
import '../../common/styles/DeviceItemStyle.dart';
import 'DeviceEnergyWidget.dart';
import 'DeviceItemTextWidget.dart';

class DeviceItemWidget extends StatefulWidget {
  final DeviceInfoModel deviceInfoModel;
  final double deviceItemHeight;

  DeviceItemWidget({
    Key? key,
    required this.deviceInfoModel,
    required this.deviceItemHeight,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DeviceItemWidgetState(deviceInfoModel: deviceInfoModel, deviceItemHeight: deviceItemHeight);
  }
}

class DeviceItemWidgetState extends State<DeviceItemWidget> {
  final DeviceInfoModel deviceInfoModel;
  final double deviceItemHeight;
  bool isSwitchedOn = false;

  DeviceItemWidgetState({
    Key? key,
    required this.deviceInfoModel,
    required this.deviceItemHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            DeviceItemIconWidget(path: deviceInfoModel.deviceImagePath),
            Switch(
              value: isSwitchedOn,
              onChanged: (value) {
                setState(() {
                  isSwitchedOn = value;
                  deviceInfoModel.deviceState = value ? 1 : 0;
                });
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
