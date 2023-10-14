import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/presentation/common/utils/AppAssets.dart';
import 'package:flutter/cupertino.dart';

import '../../common/utils/Strings.dart';
import 'ACModeListWidget.dart';
import 'ACModelWidget.dart';
import 'ACTemperatureWidget.dart';
import 'DeviceParamWidget.dart';

class ACDetailWidget extends StatelessWidget {
  final DeviceInfoModel deviceInfoModel;

  const ACDetailWidget({
    required this.deviceInfoModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Center(
            child: Container(
                margin: const EdgeInsets.all(5.0),
                child: Image.asset(
                  AppAssets.ac,
                  height: 150,
                  fit: BoxFit.cover,
                ))),
        ACModeListWidget(deviceInfoModel: deviceInfoModel),
        const SizedBox(
          height: 50,
        ),
        ACTemperatureWidget(),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceParamWidget(
              paramName: Strings.humidity,
              value: "${deviceInfoModel.airConditioner!.humidity.toString()}%",
              image: AppAssets.humidity,
            ),
            DeviceParamWidget(
                paramName: Strings.energy_usage, value: "${deviceInfoModel.airConditioner!.humidity.toString()} KWH", image: AppAssets.energy_blue),
          ],
        )
      ]),
    );
  }
}

