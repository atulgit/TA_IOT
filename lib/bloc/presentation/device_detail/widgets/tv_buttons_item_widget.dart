import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/styles/device_item_style.dart';

class TVButtonItemWidget extends StatelessWidget {
  final String _mode;
  final String _icon;

  TVButtonItemWidget({Key? key, required String mode, required String icon})
      : _icon = icon,
        _mode = mode,
        super(key: key);

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
            _icon,
            height: 30,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            _mode,
            style: TextStyle(fontSize: 12),
          )
        ],
      )),
    );
  }
}
