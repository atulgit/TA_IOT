import 'package:TA_IOT/bloc/data/model/device_category.dart';
import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/data/repository/device_detail_repository.dart';
import 'package:TA_IOT/bloc/domain/device_detail/use_cases/get_device_detail_use_case.dart';

import '../../../data/repository/abstract_repository.dart';
import '../../common/base_use_case.dart';

class ChangeACTemperatureUseCase extends BaseUseCase {
  ChangeACTemperatureUseCase(AbstractRepository deviceDetailRepository) : super(deviceDetailRepository);

  Future<DeviceInfoModel> changeACTemperature(String increaseOrDecrease, int deviceId) async {
    var device = await GetDeviceDetailUseCase(deviceDetailRepository).getDeviceDetail(deviceId);
    if (increaseOrDecrease == "+" && device.airConditioner!.temperature < 100)
      device.airConditioner?.temperature++;
    else if (increaseOrDecrease == "-" && device.airConditioner!.temperature > 0) device.airConditioner?.temperature--;

    return device;
  }
}
