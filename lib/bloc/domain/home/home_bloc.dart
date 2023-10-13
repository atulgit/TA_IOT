import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:meta/meta.dart';
import '../../data/model/device_model.dart';
import '../../data/repository/device_detail_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final DeviceDetailRepository deviceDetailRepository;

  HomeBloc(this.deviceDetailRepository) : super(DeviceListLoading());

  @override
  Stream<HomeScreenState> mapEventToState(event) async* {
    yield DeviceListLoading();
    try {
      if (event is DeviceListEvent) {
        var deviceList = await deviceDetailRepository.getDeviceList();
        yield DeviceListLoaded(deviceList);
      } else if (event is DeviceStateEvent) {
        var deviceList = await deviceDetailRepository.getDeviceList();
        deviceList.where((element) => element.deviceId == event.deviceId).single.deviceState = event.state;
        // yield DeviceStateChanged(deviceList);
        emit(DeviceStateChanged(deviceList));
      }
    } catch (e) {
      yield DeviceListError();
    }
  }
}
