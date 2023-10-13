import 'package:flutter/cupertino.dart';

import '../../../data/model/device_model.dart';

class DeviceEnergyWidget extends StatelessWidget {
  const DeviceEnergyWidget({
    Key? key,
    required this.deviceInfoModel,
  }) : super(key: key);

  final DeviceInfoModel deviceInfoModel;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(
        children: [
          Image.asset(
            "assets/images/energy.png",
            height: 30,
            width: 30,
            fit: BoxFit.cover,
          )
        ],
      ),
      Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Energy Usage", style: TextStyle(fontSize: 14)),
            const SizedBox(
              height: 5,
            ),
            Text(deviceInfoModel.energyUsage.toString() + " KWH", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ]))
    ]);
  }
}