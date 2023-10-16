import 'package:ta_iot/bloc/data/model/device_model.dart';


import '../../../data/repository/abstract_repository.dart';
import '../../common/base_use_case.dart';

class GetDeviceListUseCase extends BaseUseCase {
  GetDeviceListUseCase(AbstractRepository deviceDetailRepository) : super(deviceDetailRepository);

  Future<List<DeviceInfoModel>> getDeviceList() async {
    var deviceList = await deviceDetailRepository.getDeviceList();
    return deviceList;
  }
}
