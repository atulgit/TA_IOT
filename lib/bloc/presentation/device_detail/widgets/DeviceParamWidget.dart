import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/device_detail/device_detail_bloc.dart';
import '../../common/styles/DeviceItemStyle.dart';
import '../../home/widgets/DeviceItemIconWidget.dart';

class DeviceParamWidget extends StatelessWidget {
  final String paramName;
  Function? onTap;
  final String value;
  String? image;

  DeviceParamWidget({required this.value, required this.paramName, this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return _getWidgetBody();
  }

  Widget _getWidgetBody() {
    return InkWell(
        onTap: () {
          if (onTap != null) onTap!();
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
                    path: image != null ? image! : "",
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
                            "$value",
                            style: TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            paramName,
                            style: TextStyle(color: Colors.black54),
                          )
                        ],
                      ))
                ],
              )),
        ));
  }
}
