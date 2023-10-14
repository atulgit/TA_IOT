import 'package:TA_IOT/bloc/presentation/common/styles/DeviceItemStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/device_model.dart';
import '../../../domain/device_detail/device_detail_bloc.dart';
import '../../common/utils/AppAssets.dart';
import 'ACModelWidget.dart';
import 'ACTemperatureWidget.dart';
import 'DeviceParamWidget.dart';
import 'TVModesWidget.dart';
import 'TVPowerButtonWidget.dart';

class TVDetailWidget extends StatefulWidget {
  late DeviceInfoModel deviceInfoModel;

  TVDetailWidget({
    required this.deviceInfoModel,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TVDetailWidgetState(deviceInfoModel: deviceInfoModel);
  }
}

class TVDetailWidgetState extends State<TVDetailWidget> {
  late DeviceInfoModel deviceInfoModel;
  late final DeviceDetailBloc deviceDetailBloc;

  TVDetailWidgetState({required this.deviceInfoModel});

  @override
  void initState() {
    deviceDetailBloc = BlocProvider.of<DeviceDetailBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Center(
            child: Container(
                margin: const EdgeInsets.all(5.0),
                child: Image.asset(
                  AppAssets.tv_thumb,
                  height: 150,
                  fit: BoxFit.cover,
                ))),
        const SizedBox(height: 20),
        TVModesWidget(),
        const SizedBox(
          height: 50,
        ),
        TVPowerButtonWidget(),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<DeviceDetailBloc, DeviceDetailState>(builder: (context, state) {
              if (state is DeviceDetailLoadedState) {
                return _getPictureModeWidget();
              } else if (state is TVPictureModeChangedState) {
                deviceInfoModel = state.deviceDetail;
                return _getPictureModeWidget();
              }

              return Container();
            }, buildWhen: (previousState, state) {
              if (state is DeviceDetailLoadedState || state is TVPictureModeChangedState) return true;
              return false;
            }),
            BlocBuilder<DeviceDetailBloc, DeviceDetailState>(builder: (context, state) {
              if (state is DeviceDetailLoadedState) {
                return _getSoundModeWidget();
              } else if (state is TVSoundModeChangedState) {
                deviceInfoModel = state.deviceDetail;
                return _getSoundModeWidget();
              }

              return Container();
            }, buildWhen: (previousState, state) {
              if (state is DeviceDetailLoadedState || state is TVSoundModeChangedState) return true;
              return false;
            }),
          ],
        )
      ]),
    );
  }

  Widget _getPictureModeWidget() {
    return DeviceParamWidget(
      onTap: () {
        deviceDetailBloc.add(TVPictureModeChangedEvent(deviceInfoModel.deviceId));
      },
      value: _getPictureModeString(),
      paramName: "Picture Mode",
      image: AppAssets.pic_mode,
    );
  }

  Widget _getSoundModeWidget() {
    return DeviceParamWidget(
      onTap: () {
        deviceDetailBloc.add(TVSoundModeChangedEvent(deviceInfoModel.deviceId));
      },
      value: _getSoundModeString(),
      paramName: "Sound Mode",
      image: AppAssets.sound_mode,
    );
  }

  String _getPictureModeString() {
    switch (deviceInfoModel.television!.pictureMode) {
      case TelevisionPictureModes.STANDARD:
        return "Standard";

      case TelevisionPictureModes.DYNAMIC:
        return "Dynamic";

      case TelevisionPictureModes.HDR_STANDARD:
        return "HDR Standard";

      case TelevisionPictureModes.HDR_CINEMA:
        return "HDR Cinema";
    }
  }

  String _getSoundModeString() {
    switch (deviceInfoModel.television!.soundMode) {
      case TelevisionSoundModes.JAZZ:
        return "Jazz";

      case TelevisionSoundModes.MOVIE:
        return "Movie";

      case TelevisionSoundModes.MUSIC:
        return "Music";

      case TelevisionSoundModes.ROCK:
        return "Rock";
    }
  }
}
