import 'package:ta_iot/bloc/data/model/device_category_model.dart';
import 'package:ta_iot/bloc/data/model/device_model.dart';

import '../../../data/repository/abstract_repository.dart';
import '../../common/base_use_case.dart';

class CategorySelectedUseCase extends BaseUseCase {
  CategorySelectedUseCase(AbstractRepository deviceDetailRepository) : super(deviceDetailRepository);

  Future<List<DeviceInfoModel>> setCategory(DeviceCategoryType categoryType) async {
    var deviceList = await deviceDetailRepository.getDeviceList();
    if (categoryType != DeviceCategoryType.ALL)
      deviceList = deviceList.where((element) => element.deviceCategory.categoryType == categoryType).toList();

    return deviceList;
  }
}
