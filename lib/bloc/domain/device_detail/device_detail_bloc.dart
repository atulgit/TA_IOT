import 'package:ta_iot/bloc/data/model/device_model.dart';
import 'package:ta_iot/bloc/data/repository/abstract_repository.dart';
import 'package:ta_iot/bloc/domain/device_detail/use_cases/change_ac_mode_use_case.dart';
import 'package:ta_iot/bloc/domain/device_detail/use_cases/change_ac_temperature_use_case.dart';
import 'package:ta_iot/bloc/domain/device_detail/use_cases/change_tv_picture_mode_use_case.dart';
import 'package:ta_iot/bloc/domain/device_detail/use_cases/change_tv_sound_mode_use_case.dart';
import 'package:ta_iot/bloc/domain/device_detail/use_cases/get_device_detail_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:meta/meta.dart';

part 'device_detail_event.dart';

part 'device_detail_state.dart';

class DeviceDetailBloc extends Bloc<DeviceDetailEvent, DeviceDetailState> {
  final AbstractRepository _deviceDetailRepository;
  bool _isMute = false;

  DeviceDetailBloc(this._deviceDetailRepository) : super(DeviceDetailLoading());

  @override
  Stream<DeviceDetailState> mapEventToState(DeviceDetailEvent event) async* {
    yield DeviceDetailLoading();
    try {
      if (event is DeviceDetail) {
        yield DeviceDetailLoadedState(await GetDeviceDetailUseCase(_deviceDetailRepository).getDeviceDetail(event.deviceId));
      } else if (event is ChangeACModeEvent) {
        var device = await ChangeACModeUseCase(_deviceDetailRepository).changeACMode(event.deviceId, event.mode);
        yield ACModeChangedState(device);
      } else if (event is TVPictureModeChangedEvent) {
        var device = await ChangeTVPictureModeUseCase(_deviceDetailRepository).changeTVPictureMode(event.deviceId);
        yield TVPictureModeChangedState(device);
      } else if (event is TVSoundModeChangedEvent) {
        var device = await ChangeTVSoundModeUseCase(_deviceDetailRepository).changeTVSoundMode(event.deviceId);
        yield(TVSoundModeChangedState(device));
      } else if (event is ACTemperatureChangeEvent) {
        var device = await ChangeACTemperatureUseCase(_deviceDetailRepository).changeACTemperature(event.increaseOrDecrease, event.deviceId);
        yield(ACTemperatureChangeState(device));
      } else if (event is TVVolumeEvent) {
        _isMute = !_isMute;
        yield(TVVolumeState(_isMute));
      }
    } catch (e) {
      yield DeviceDetailError();
    }
  }
}
