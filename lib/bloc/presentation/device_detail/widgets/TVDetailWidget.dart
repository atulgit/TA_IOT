import 'package:TA_IOT/bloc/presentation/common/styles/DeviceItemStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/model/device_model.dart';
import 'ACModelWidget.dart';
import 'ACTemperatureWidget.dart';
import 'DeviceParamWidget.dart';
import 'TVModesWidget.dart';
import 'TVPowerButtonWidget.dart';

class TVDetailWidget extends StatelessWidget {
  final DeviceInfoModel deviceInfoModel;

  const TVDetailWidget({
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
                  "assets/images/tv_thumb.png",
                  height: 150,
                  fit: BoxFit.cover,
                ))),
        const SizedBox(height: 20),
        TVModesWidget(),
        const SizedBox(
          height: 50,
        ),
        TVPowerButtonWidget(),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceParamWidget(
              value: "Movie",
              paramName: "Picture Mode",
              image: "assets/images/pic_mode.png",
            ),
            DeviceParamWidget(
              value: "Jazz",
              paramName: "Sound Mode",
              image: "assets/images/sound_mode.png",
            ),
          ],
        )
      ]),
    );
  }
}
