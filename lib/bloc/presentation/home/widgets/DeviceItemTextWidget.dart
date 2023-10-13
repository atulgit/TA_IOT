import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/model/device_model.dart';

class DeviceItemWidgetText extends StatelessWidget {
  const DeviceItemWidgetText({
    Key? key,
    required this.deviceInfoModel,
  }) : super(key: key);

  final DeviceInfoModel deviceInfoModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            deviceInfoModel.deviceName,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            deviceInfoModel.deviceCategory.categoryName,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            deviceInfoModel.deviceState == 1 ? "On" : "Off",
            textAlign: TextAlign.center,
          )
        ]));
  }
}
