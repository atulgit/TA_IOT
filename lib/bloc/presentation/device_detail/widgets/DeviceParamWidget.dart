import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/styles/DeviceItemStyle.dart';
import '../../home/widgets/DeviceItemIconWidget.dart';

class DeviceParamWidget extends StatelessWidget {
  final String value;
  final String paramName;
  String? image;

  DeviceParamWidget({required this.value, required this.paramName, Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        style: TextStyle(color: Colors.black87, fontSize: 18),
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
    );
  }
}
