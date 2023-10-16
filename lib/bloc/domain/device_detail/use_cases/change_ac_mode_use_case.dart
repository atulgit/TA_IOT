import 'package:TA_IOT/bloc/data/model/device_category.dart';
import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/data/repository/abstract_repository.dart';
import 'package:TA_IOT/bloc/data/repository/device_detail_repository.dart';
import 'package:TA_IOT/bloc/domain/device_detail/use_cases/get_device_detail_use_case.dart';

import '../../common/base_use_case.dart';

class ChangeACModeUseCase extends BaseUseCase {
  ChangeACModeUseCase(AbstractRepository deviceDetailRepository) : super(deviceDetailRepository);

  Future<DeviceInfoModel> changeACMode(int deviceId, AirConditionerModes mode) async {
    var device = await GetDeviceDetailUseCase(deviceDetailRepository).getDeviceDetail(deviceId);
    device.airConditioner?.mode = mode;
    return device;
  }
}
