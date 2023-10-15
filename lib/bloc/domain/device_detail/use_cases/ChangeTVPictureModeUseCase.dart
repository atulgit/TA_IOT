import 'package:TA_IOT/bloc/data/model/device_category.dart';
import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/data/repository/device_detail_repository.dart';
import 'package:TA_IOT/bloc/domain/device_detail/use_cases/GetDeviceDetailUseCase.dart';

import '../../../data/repository/abstract_repository.dart';
import '../../common/BaseUseCase.dart';

class ChangeTVPictureModeUseCase extends BaseUseCase {
  ChangeTVPictureModeUseCase(AbstractRepository deviceDetailRepository) : super(deviceDetailRepository);

  Future<DeviceInfoModel> changeTVPictureMode(int deviceId) async {
    var device = await GetDeviceDetailUseCase(deviceDetailRepository).getDeviceDetail(deviceId);
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

    return device;
  }
}
