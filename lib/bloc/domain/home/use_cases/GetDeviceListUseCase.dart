import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/data/repository/device_detail_repository.dart';


import '../../common/BaseUseCase.dart';

class GetDeviceListUseCase extends BaseUseCase {
  GetDeviceListUseCase(DeviceDetailRepository deviceDetailRepository) : super(deviceDetailRepository);

  Future<List<DeviceInfoModel>> getDeviceList() async {
    var deviceList = await deviceDetailRepository.getDeviceList();
    return deviceList;
  }
}
