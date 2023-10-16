
import 'package:TA_IOT/bloc/presentation/common/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/utils/app_assets.dart';
import '../../common/utils/strings.dart';

class EnergyWidget extends StatelessWidget {
  final double _energyValue;

  const EnergyWidget({
    required double energyValue,
    super.key,
  }) : _energyValue = energyValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.44,
        height: 100,
        child: Stack(children: [
          Positioned(top: 0, child: Text(Strings.energyUsage)),
          Positioned(
              top: 30,
              child: Text(
                _energyValue.toString(),
                style: DashboardTextStyles.energyValueStyle,
              )),
          Positioned(
              right: 0,
              child: Image.asset(
                AppAssets.energy,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              )),
          Positioned(bottom: 0, right: 20, child: Text(Strings.kwh))
        ]));
  }
}