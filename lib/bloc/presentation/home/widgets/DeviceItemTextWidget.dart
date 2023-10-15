import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/model/device_model.dart';

class DeviceItemWidgetText extends StatelessWidget {
  final DeviceInfoModel _deviceInfoModel;

  const DeviceItemWidgetText({
    Key? key,
    required DeviceInfoModel deviceInfoModel,
  }) : _deviceInfoModel = deviceInfoModel, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            _deviceInfoModel.deviceName,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            _deviceInfoModel.deviceCategory.categoryName,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            _deviceInfoModel.deviceState == 1 ? "On" : "Off",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ]));
  }
}
