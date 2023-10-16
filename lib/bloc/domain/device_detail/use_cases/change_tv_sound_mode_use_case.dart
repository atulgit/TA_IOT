import 'package:ta_iot/bloc/data/model/device_model.dart';
import 'package:ta_iot/bloc/domain/device_detail/use_cases/get_device_detail_use_case.dart';

import '../../../data/repository/abstract_repository.dart';
import '../../common/base_use_case.dart';

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
      default:
        device.television?.soundMode = TelevisionSoundModes.MUSIC;
        break;
    }

    return device;
  }
}
