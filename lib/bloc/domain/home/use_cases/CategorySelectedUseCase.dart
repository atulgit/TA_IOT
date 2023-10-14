import 'package:TA_IOT/bloc/data/model/device_category.dart';
import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/data/repository/device_detail_repository.dart';

import '../../common/BaseUseCase.dart';

class CategorySelectedUseCase extends BaseUseCase {
  CategorySelectedUseCase(DeviceDetailRepository deviceDetailRepository) : super(deviceDetailRepository);

  Future<List<DeviceInfoModel>> setCategory(DeviceCategoryType categoryType) async {
    var deviceList = await deviceDetailRepository.getDeviceList();
    if (categoryType != DeviceCategoryType.ALL)
      deviceList = deviceList.where((element) => element.deviceCategory.categoryType == categoryType).toList();

    return deviceList;
  }
}
