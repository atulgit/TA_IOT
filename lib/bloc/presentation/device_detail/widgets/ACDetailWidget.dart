import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:flutter/cupertino.dart';

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
                  "assets/images/ac_icon.png",
                  height: 150,
                  fit: BoxFit.cover,
                ))),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ACModeWidget(
              mode: "Cool",
              icon: "assets/images/cool.png",
            ),
            ACModeWidget(
              mode: "Dry",
              icon: "assets/images/dry.png",
            ),
            ACModeWidget(
              mode: "Sleep",
              icon: "assets/images/sleep.png",
            )
          ],
        ),
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
            DeviceParamWidget(paramName: "Humidity", value: "${deviceInfoModel.airConditioner!.humidity.toString()}%", image: "assets/images/humidity.png",),
            DeviceParamWidget(paramName: "Energy Usage", value: "${deviceInfoModel.airConditioner!.humidity.toString()} KWH", image: "assets/images/energy_blue.png"),
          ],
        )
      ]),
    );
  }
}
