import 'package:TA_IOT/bloc/data/model/device_category.dart';
import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/data/repository/device_detail_repository.dart';
import 'package:TA_IOT/bloc/domain/device_detail/use_cases/GetDeviceDetailUseCase.dart';

import '../../../data/repository/abstract_repository.dart';
import '../../common/BaseUseCase.dart';

class ChangeTVSoundModeUseCase extends BaseUseCase {
  ChangeTVSoundModeUseCase(AbstractRepository deviceDetailRepository) : super(deviceDetailRepository);

  Future<DeviceInfoModel> changeTVSoundMode(int deviceId) async {
    var device = await GetDeviceDetailUseCase(deviceDetailRepository).getDeviceDetail(deviceId);
    switch (device.television?.soundMode) {
      case TelevisionSoundModes.MUSIC:
        device.television?.soundMode = TelevisionSoundModes.ROCK;
        break;
      case TelevisionSoundModes.ROCK:
        device.television?.soundMode = TelevisionSoundModes.MOVIE;
        break;
      case TelevisionSoundModes.MOVIE:
        device.television?.soundMode = TelevisionSoundModes.JAZZ;
        break;
      case TelevisionSoundModes.JAZZ:
        device.television?.soundMode = TelevisionSoundModes.MUSIC;
        break;
    }

    return device;
  }
}
