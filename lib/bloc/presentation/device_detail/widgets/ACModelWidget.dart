import 'package:flutter/cupertino.dart';

import '../../common/styles/DeviceItemStyle.dart';

class ACModeWidget extends StatelessWidget {
  String mode = "Cool";
  String icon;

  ACModeWidget({Key? key, required this.mode, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 80,
      height: 80,
      decoration: CommonStyle.getACModeItemDecorator(),
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
            mode,
            style: TextStyle(fontSize: 12),
          )
        ],
      )),
    );
  }
}
