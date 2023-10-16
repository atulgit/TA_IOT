import 'package:flutter/material.dart';

import '../../common/utils/app_assets.dart';

class TVPowerButtonWidget extends StatelessWidget {
  const TVPowerButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Container(
              margin: EdgeInsets.all(10),
              height: 50,
              width: 50,
              child: Image.asset(
                AppAssets.power,
                height: 20,
                width: 20,
                fit: BoxFit.cover,
              ))),
    );
  }
}
