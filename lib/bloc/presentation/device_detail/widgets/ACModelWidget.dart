import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/model/device_model.dart';
import '../../common/styles/DeviceItemStyle.dart';

class ACModeWidget extends StatelessWidget {
  AirConditionerModes mode = AirConditionerModes.Dry;
  String icon;
  DeviceInfoModel deviceInfoModel;
  Function(AirConditionerModes)? modeSelected;

  ACModeWidget({Key? key, this.modeSelected, required this.mode, required this.icon, required this.deviceInfoModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (modeSelected != null) modeSelected!(mode);

          // deviceInfoModel.airConditioner?.mode = mode;
        },
        child: Container(
          margin: EdgeInsets.all(10),
          width: 80,
          height: 80,
          decoration: CommonStyle.getACModeItemDecorator(color: _getBackgroundColor()),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                height: 30,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                mode.name,
                style: TextStyle(fontSize: 12),
              )
            ],
          )),
        ));
  }

  Color _getBackgroundColor() {
    //If Mode is Selected
    if (deviceInfoModel.airConditioner?.mode == mode) return Colors.blue.withOpacity(.2);

    return Colors.white;
  }
}
