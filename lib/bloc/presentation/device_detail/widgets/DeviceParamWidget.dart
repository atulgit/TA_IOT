import 'package:TA_IOT/bloc/presentation/common/styles/TextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/device_detail/device_detail_bloc.dart';
import '../../common/styles/DeviceItemStyle.dart';
import '../../home/widgets/DeviceItemIconWidget.dart';

class DeviceParamWidget extends StatelessWidget {
  final String _paramName;
  Function? _onTap;
  final String _value;
  String? _image;

  DeviceParamWidget({required String value, required String paramName, String? image, Function? onTap}) : _image = image, _value = value, _onTap = onTap, _paramName = paramName;

  @override
  Widget build(BuildContext context) {
    return _getWidgetBody();
  }

  Widget _getWidgetBody() {
    return InkWell(
        onTap: () {
          if (_onTap != null) _onTap!();
        },
        child: Container(
          decoration: CommonStyle.getDeviceParamsDecorator(),
          width: 120,
          height: 120,
          child: Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DeviceItemIconWidget(
                    path: _image != null ? _image! : "",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$_value",
                            style: DeviceParamTextStyles.valueStyle,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            _paramName,
                            style: DeviceParamTextStyles.paramStyle,
                          )
                        ],
                      ))
                ],
              )),
        ));
  }
}
