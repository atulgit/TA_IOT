import 'package:TA_IOT/bloc/data/model/device_model.dart';
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
      var deviceList = await deviceDetailRepository.getDeviceList();
      // yield DeviceDetailLoaded(deviceList);
    } catch (e) {
      yield DeviceDetailError();
    }
  }
}
