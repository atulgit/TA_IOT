import 'package:TA_IOT/bloc/presentation/common/styles/TextStyles.dart';
import 'package:TA_IOT/bloc/presentation/common/utils/Strings.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/model/device_model.dart';

class DeviceEnergyWidget extends StatelessWidget {
  final DeviceInfoModel _deviceInfoModel;

  const DeviceEnergyWidget({
    Key? key,
    required DeviceInfoModel deviceInfoModel,
  }) : _deviceInfoModel = deviceInfoModel, super(key: key);

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
            Text(Strings.energyUsage, style: TextStyle(fontSize: 14)),
            const SizedBox(
              height: 5,
            ),
            Text("${_deviceInfoModel.energyUsage.toString()}  ${Strings.kwh.toUpperCase()}", style: DashboardTextStyles.energyStyle)
          ]))
    ]);
  }
}
