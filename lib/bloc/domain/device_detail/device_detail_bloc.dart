import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/device_detail_repository.dart';
import 'dart:async';
import 'package:meta/meta.dart';

part 'device_detail_event.dart';

part 'device_detail_state.dart';

class DeviceDetailBloc extends Bloc<DeviceDetailEvent, DeviceDetailState> {
  final DeviceDetailRepository deviceDetailRepository;

  DeviceDetailBloc(this.deviceDetailRepository) : super(DeviceDetailLoading());

  @override
  Stream<DeviceDetailState> mapEventToState(DeviceDetailEvent event) async* {
    yield DeviceDetailLoading();
    try {
      if (event is DeviceDetail) {
        yield DeviceDetailLoadedState(await _getDevice(event.deviceId));
      } else if (event is ChangeACModeEvent) {
        var device = await _getDevice(event.deviceId);
        device.airConditioner?.mode = event.mode;
        yield ACModeChangedState(device);
      } else if (event is TVPictureModeChangedEvent) {
        var device = await _getDevice(event.deviceId);
        switch (device.television?.pictureMode) {
          case TelevisionPictureModes.STANDARD:
            device.television?.pictureMode = TelevisionPictureModes.DYNAMIC;
            break;
          case TelevisionPictureModes.DYNAMIC:
            device.television?.pictureMode = TelevisionPictureModes.HDR_CINEMA;
            break;
          case TelevisionPictureModes.HDR_CINEMA:
            device.television?.pictureMode = TelevisionPictureModes.HDR_STANDARD;
            break;
          case TelevisionPictureModes.HDR_STANDARD:
            device.television?.pictureMode = TelevisionPictureModes.STANDARD;
            break;
        }
        yield TVPictureModeChangedState(device);
      }
    } catch (e) {
      yield DeviceDetailError();
    }
  }

  Future<DeviceInfoModel> _getDevice(int deviceId) async {
    var deviceList = await deviceDetailRepository.getDeviceList();
    var device = deviceList.where((element) => element.deviceId == deviceId).single;
    return device;
  }
}
