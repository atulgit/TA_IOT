import 'package:TA_IOT/bloc/data/model/dashboard_model.dart';

import '../model/device_category.dart';
import '../model/device_model.dart';

class DeviceDetailProvider {
  List<DeviceInfoModel> _devices = [
    DeviceInfoModel(1, DeviceCategory(DeviceCategoryType.AC, "Air Conditioner", ""), "", "assets/images/ac_icon.png", "LG 101", 0, 12,
        airConditioner: AirConditionerModel(AirConditionerModes.Cool, 80, 24)),
    DeviceInfoModel(2, DeviceCategory(DeviceCategoryType.AC, "Air Conditioner", ""), "", "assets/images/ac_icon.png", "VD 13", 0, 15,
        airConditioner: AirConditionerModel(AirConditionerModes.Dry, 80, 24)),
    DeviceInfoModel(3, DeviceCategory(DeviceCategoryType.TV, "Television", ""), "", "assets/images/tv.png", "VU 182C", 0, 5,
        television: TelevisionModel(10, TelevisionPictureModes.STANDARD, TelevisionSoundModes.JAZZ))
  ];

  Future<List<DeviceInfoModel>> getDeviceList() async {
    return _devices;
  }

  Future<DashboardModel> getDashboardParams() async {
    return DashboardModel(18, 31, 190);
  }
}
