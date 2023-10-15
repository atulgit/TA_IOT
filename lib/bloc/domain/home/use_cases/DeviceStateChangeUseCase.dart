import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/data/repository/device_detail_repository.dart';


import '../../../data/repository/abstract_repository.dart';
import '../../common/BaseUseCase.dart';

class DeviceStateChangeUseCase extends BaseUseCase {
  DeviceStateChangeUseCase(AbstractRepository deviceDetailRepository) : super(deviceDetailRepository);

  Future<DeviceInfoModel> setDeviceState(int deviceId, int state) async {
    var deviceList = await deviceDetailRepository.getDeviceList();
    var device = deviceList.where((element) => element.deviceId == deviceId).single;
    device.deviceState = state;
    return device;
  }
}
