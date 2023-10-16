import 'package:flutter/material.dart';
import 'package:ta_iot/bloc/data/model/device_model.dart';
import 'package:ta_iot/bloc/presentation/common/utils/app_assets.dart';
import 'package:flutter/cupertino.dart';

import '../../common/utils/strings.dart';
import 'ac_mode_list_widget.dart';
import 'ac_temperature_widget.dart';
import 'device_param_widget.dart';

class ACDetailWidget extends StatelessWidget {
  final DeviceInfoModel _deviceInfoModel;

  const ACDetailWidget({
    required DeviceInfoModel deviceInfoModel,
    Key? key,
  })  : _deviceInfoModel = deviceInfoModel,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Center(
            child: Container(
                margin: const EdgeInsets.all(5.0),
                child: Image.asset(
                  AppAssets.ac,
                  height: 150,
                  fit: BoxFit.cover,
                ))),
        ACModeListWidget(deviceInfoModel: _deviceInfoModel),
        const SizedBox(
          height: 50,
        ),
        ACTemperatureWidget(
          deviceInfoModel: _deviceInfoModel,
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceParamWidget(
              paramName: Strings.humidity,
              value: "${_deviceInfoModel.airConditioner!.humidity.toString()}%",
              image: AppAssets.humidity,
            ),
            DeviceParamWidget(
                paramName: Strings.energyUsage, value: "${_deviceInfoModel.airConditioner!.humidity.toString()} KWH", image: AppAssets.energy_blue),
          ],
        )
      ]),
    ));
  }
}
