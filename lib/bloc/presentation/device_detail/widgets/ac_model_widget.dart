import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/model/device_model.dart';
import '../../common/styles/device_item_style.dart';

class ACModeWidget extends StatelessWidget {
  AirConditionerModes _mode = AirConditionerModes.Dry;
  String _icon;
  DeviceInfoModel _deviceInfoModel;
  Function(AirConditionerModes)? _modeSelected;

  ACModeWidget({Key? key, dynamic Function(AirConditionerModes)? modeSelected, required AirConditionerModes mode, required String icon, required DeviceInfoModel deviceInfoModel}) : _modeSelected = modeSelected, _deviceInfoModel = deviceInfoModel, _icon = icon, _mode = mode, super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (_modeSelected != null) _modeSelected!(_mode);

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
                _icon,
                height: 30,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                _mode.name,
                style: TextStyle(fontSize: 12),
              )
            ],
          )),
        ));
  }

  Color _getBackgroundColor() {
    //If Mode is Selected
    if (_deviceInfoModel.airConditioner?.mode == _mode) return Colors.blue.withOpacity(.2);

    return Colors.white;
  }
}
