
import '../model/device_category.dart';
import '../model/device_model.dart';

class DeviceDetailProvider {
  Future<List<DeviceInfoModel>> getDeviceList() async {
    List<DeviceInfoModel> devices = [
      DeviceInfoModel(1, DeviceCategory(DeviceCategoryType.AC, "Air Conditioner", ""), "", "assets/images/ac_icon.png", "LG 101", 0, 12,
          airConditioner: AirConditioner(AirConditionerModes.COOL, 80, 24)),
      DeviceInfoModel(2, DeviceCategory(DeviceCategoryType.AC, "Air Conditioner", ""), "", "assets/images/ac_icon.png", "VD 13", 0, 15,
          airConditioner: AirConditioner(AirConditionerModes.DRY, 80, 24)),
      DeviceInfoModel(3, DeviceCategory(DeviceCategoryType.TV, "Television", ""), "", "assets/images/tv.png", "VU 182C", 0, 5,
          television: Television(10, TelevisionPictureModes.STANDARD, TelevisionSoundModes.JAZZ))
    ];

    return devices;
  }
}
