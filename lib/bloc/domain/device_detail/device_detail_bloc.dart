import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/data/repository/abstract_repository.dart';
import 'package:TA_IOT/bloc/domain/device_detail/use_cases/ChangeACModeUseCase.dart';
import 'package:TA_IOT/bloc/domain/device_detail/use_cases/ChangeACTemperatureUseCase.dart';
import 'package:TA_IOT/bloc/domain/device_detail/use_cases/ChangeTVPictureModeUseCase.dart';
import 'package:TA_IOT/bloc/domain/device_detail/use_cases/ChangeTVSoundModeUseCase.dart';
import 'package:TA_IOT/bloc/domain/device_detail/use_cases/GetDeviceDetailUseCase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/device_detail_repository.dart';
import 'dart:async';
import 'package:meta/meta.dart';

part 'device_detail_event.dart';

part 'device_detail_state.dart';

class DeviceDetailBloc extends Bloc<DeviceDetailEvent, DeviceDetailState> {
  final AbstractRepository deviceDetailRepository;

  DeviceDetailBloc(this.deviceDetailRepository) : super(DeviceDetailLoading());

  @override
  Stream<DeviceDetailState> mapEventToState(DeviceDetailEvent event) async* {
    yield DeviceDetailLoading();
    try {
      if (event is DeviceDetail) {
        yield DeviceDetailLoadedState(await GetDeviceDetailUseCase(deviceDetailRepository).getDeviceDetail(event.deviceId));
      } else if (event is ChangeACModeEvent) {
        var device = await ChangeACModeUseCase(deviceDetailRepository).changeACMode(event.deviceId, event.mode);
        yield ACModeChangedState(device);
      } else if (event is TVPictureModeChangedEvent) {
        var device = await ChangeTVPictureModeUseCase(deviceDetailRepository).changeTVPictureMode(event.deviceId);
        yield TVPictureModeChangedState(device);
      } else if (event is TVSoundModeChangedEvent) {
        var device = await ChangeTVSoundModeUseCase(deviceDetailRepository).changeTVSoundMode(event.deviceId);
        emit(TVSoundModeChangedState(device));
      } else if (event is ACTemperatureChangeEvent) {
        var device = await ChangeACTemperatureUseCase(deviceDetailRepository).changeACTemperature(event.increaseOrDecrease, event.deviceId);
        emit(ACTemperatureChangeState(device));
      }
    } catch (e) {
      yield DeviceDetailError();
    }
  }
}
