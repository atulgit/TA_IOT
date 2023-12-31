import 'package:ta_iot/bloc/domain/device_detail/device_detail_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/device_model.dart';
import '../../common/utils/app_assets.dart';
import 'ac_model_widget.dart';

class ACModeListWidget extends StatefulWidget {
  final DeviceInfoModel _deviceInfoModel;

  ACModeListWidget({
    required DeviceInfoModel deviceInfoModel,
  }) : _deviceInfoModel = deviceInfoModel;

  @override
  State<StatefulWidget> createState() {
    return _ACModeListWidgetState(deviceInfoModel: _deviceInfoModel);
  }
}

class _ACModeListWidgetState extends State<ACModeListWidget> {
  late DeviceInfoModel _deviceInfoModel;

  _ACModeListWidgetState({
    required DeviceInfoModel deviceInfoModel,
  }) : _deviceInfoModel = deviceInfoModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceDetailBloc, DeviceDetailState>(
      builder: (context, state) {
        if (state is ACModeChangedState) {
          _deviceInfoModel = state.deviceInfoModel;
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
            home.add(ChangeACModeEvent(_deviceInfoModel.deviceId, mode));
            // setState(() {
            //   deviceInfoModel.airConditioner?.mode = mode;
            // });
          },
          mode: AirConditionerModes.Cool,
          icon: AppAssets.cool,
          deviceInfoModel: _deviceInfoModel,
        ),
        ACModeWidget(
          modeSelected: (mode) {
            home.add(ChangeACModeEvent(_deviceInfoModel.deviceId, mode));
          },
          mode: AirConditionerModes.Dry,
          icon: AppAssets.dry,
          deviceInfoModel: _deviceInfoModel,
        ),
        ACModeWidget(
          modeSelected: (mode) {
            home.add(ChangeACModeEvent(_deviceInfoModel.deviceId, mode));
          },
          mode: AirConditionerModes.Sleep,
          icon: AppAssets.sleep,
          deviceInfoModel: _deviceInfoModel,
        )
      ],
    );
  }
}
