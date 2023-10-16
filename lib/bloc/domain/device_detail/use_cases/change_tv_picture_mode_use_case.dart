import 'package:ta_iot/bloc/data/model/device_model.dart';
import 'package:ta_iot/bloc/domain/device_detail/use_cases/get_device_detail_use_case.dart';
import '../../../data/repository/abstract_repository.dart';
import '../../common/base_use_case.dart';

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
      default:
        device.television?.pictureMode = TelevisionPictureModes.STANDARD;
        break;
    }

    return device;
  }
}
