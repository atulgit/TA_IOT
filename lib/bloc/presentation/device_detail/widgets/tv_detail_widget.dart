import 'package:ta_iot/bloc/presentation/common/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/device_model.dart';
import '../../../domain/device_detail/device_detail_bloc.dart';
import '../../common/utils/app_assets.dart';
import 'device_param_widget.dart';
import 'tv_modes_widget.dart';
import 'tv_power_button_widget.dart';

class TVDetailWidget extends StatefulWidget {
  late final DeviceInfoModel _deviceInfoModel;

  TVDetailWidget({
    required DeviceInfoModel deviceInfoModel,
    Key? key,
  }) : _deviceInfoModel = deviceInfoModel, super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TVDetailWidgetState(deviceInfoModel: _deviceInfoModel);
  }
}

class TVDetailWidgetState extends State<TVDetailWidget> {
  late DeviceInfoModel _deviceInfoModel;
  late final DeviceDetailBloc _deviceDetailBloc;

  TVDetailWidgetState({required DeviceInfoModel deviceInfoModel}) : _deviceInfoModel = deviceInfoModel;

  @override
  void initState() {
    super.initState();
    _deviceDetailBloc = BlocProvider.of<DeviceDetailBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
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
                _deviceInfoModel = state.deviceDetail;
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
                _deviceInfoModel = state.deviceDetail;
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
    ));
  }

  Widget _getPictureModeWidget() {
    return DeviceParamWidget(
      onTap: () {
        _deviceDetailBloc.add(TVPictureModeChangedEvent(_deviceInfoModel.deviceId));
      },
      value: _getPictureModeString(),
      paramName: Strings.pictureMode,
      image: AppAssets.pic_mode,
    );
  }

  Widget _getSoundModeWidget() {
    return DeviceParamWidget(
      onTap: () {
        _deviceDetailBloc.add(TVSoundModeChangedEvent(_deviceInfoModel.deviceId));
      },
      value: _getSoundModeString(),
      paramName: Strings.soundMode,
      image: AppAssets.sound_mode,
    );
  }

  String _getPictureModeString() {
    switch (_deviceInfoModel.television!.pictureMode) {
      case TelevisionPictureModes.STANDARD:
        return Strings.picModeStandard;

      case TelevisionPictureModes.DYNAMIC:
        return Strings.picModeDynamic;

      case TelevisionPictureModes.HDR_STANDARD:
        return Strings.picModeHDRStandard;

      case TelevisionPictureModes.HDR_CINEMA:
        return Strings.picModeHDRCinema;
    }
  }

  String _getSoundModeString() {
    switch (_deviceInfoModel.television!.soundMode) {
      case TelevisionSoundModes.JAZZ:
        return Strings.soundModeJazz;

      case TelevisionSoundModes.MOVIE:
        return Strings.soundModeMovie;

      case TelevisionSoundModes.MUSIC:
        return Strings.soundModeMusic;

      case TelevisionSoundModes.ROCK:
        return Strings.soundModeRock;
    }
  }
}
