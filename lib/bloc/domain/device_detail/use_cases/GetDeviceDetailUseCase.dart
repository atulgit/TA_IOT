import 'package:TA_IOT/bloc/data/model/device_category.dart';
import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/data/repository/abstract_repository.dart';
import 'package:TA_IOT/bloc/data/repository/device_detail_repository.dart';

import '../../common/BaseUseCase.dart';

class GetDeviceDetailUseCase extends BaseUseCase {
  GetDeviceDetailUseCase(AbstractRepository deviceDetailRepository) : super(deviceDetailRepository);

  Future<DeviceInfoModel> getDeviceDetail(int deviceId) async {
    var deviceList = await deviceDetailRepository.getDeviceList();
    var device = deviceList.where((element) => element.deviceId == deviceId).single;
    return device;
  }
}
