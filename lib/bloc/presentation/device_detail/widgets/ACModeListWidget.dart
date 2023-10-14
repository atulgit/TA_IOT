import 'package:TA_IOT/bloc/domain/device_detail/device_detail_bloc.dart';
import 'package:TA_IOT/bloc/domain/home/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/device_model.dart';
import '../../common/utils/AppAssets.dart';
import 'ACModelWidget.dart';

class ACModeListWidget extends StatefulWidget {
  final DeviceInfoModel deviceInfoModel;

  ACModeListWidget({
    required this.deviceInfoModel,
  });

  @override
  State<StatefulWidget> createState() {
    return ACModeListWidgetState(deviceInfoModel: deviceInfoModel);
  }
}

class ACModeListWidgetState extends State<ACModeListWidget> {
  late DeviceInfoModel deviceInfoModel;

  ACModeListWidgetState({
    required this.deviceInfoModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceDetailBloc, DeviceDetailState>(
      builder: (context, state) {
        if (state is ACModeChangedState) {
          deviceInfoModel = state.deviceInfoModel;
          return _getACModesRow();
        } else if (state is DeviceDetailLoadedState) {
          return _getACModesRow();
        }

        return Container();
      },
      buildWhen: (context, state) {
        if (state is DeviceDetailLoadedState || state is ACModeChangedState) return true;
        return false;
      },
    );
  }

  Widget _getACModesRow() {
    var home = BlocProvider.of<DeviceDetailBloc>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ACModeWidget(
          modeSelected: (mode) {
            home.add(ChangeACModeEvent(deviceInfoModel.deviceId, mode));
            // setState(() {
            //   deviceInfoModel.airConditioner?.mode = mode;
            // });
          },
          mode: AirConditionerModes.Cool,
          icon: AppAssets.cool,
          deviceInfoModel: deviceInfoModel,
        ),
        ACModeWidget(
          modeSelected: (mode) {
            home.add(ChangeACModeEvent(deviceInfoModel.deviceId, mode));
            // setState(() {
            //   deviceInfoModel.airConditioner?.mode = mode;
            // });
          },
          mode: AirConditionerModes.Dry,
          icon: AppAssets.dry,
          deviceInfoModel: deviceInfoModel,
        ),
        ACModeWidget(
          modeSelected: (mode) {
            home.add(ChangeACModeEvent(deviceInfoModel.deviceId, mode));
            // setState(() {
            //   deviceInfoModel.airConditioner?.mode = mode;
            // });
          },
          mode: AirConditionerModes.Sleep,
          icon: AppAssets.sleep,
          deviceInfoModel: deviceInfoModel,
        )
      ],
    );
  }
}
