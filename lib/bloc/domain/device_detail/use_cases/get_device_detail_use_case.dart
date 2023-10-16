import 'package:ta_iot/bloc/data/model/device_model.dart';
import 'package:ta_iot/bloc/data/repository/abstract_repository.dart';

import '../../common/base_use_case.dart';

class GetDeviceDetailUseCase extends BaseUseCase {
  GetDeviceDetailUseCase(AbstractRepository deviceDetailRepository) : super(deviceDetailRepository);

  Future<DeviceInfoModel> getDeviceDetail(int deviceId) async {
    var deviceList = await deviceDetailRepository.getDeviceList();
    var device = deviceList.where((element) => element.deviceId == deviceId).single;
    return device;
  }
}
