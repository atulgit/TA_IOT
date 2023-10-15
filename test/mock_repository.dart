import 'package:TA_IOT/bloc/data/model/dashboard_model.dart';
import 'package:TA_IOT/bloc/data/model/device_category.dart';
import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/data/repository/abstract_repository.dart';

class MockDeviceDetailRepository extends AbstractRepository {
  DashboardModel _mockDashboardModel = DashboardModel(18, 31, 190);

  List<DeviceInfoModel> _mockDevices = [
    DeviceInfoModel(1, DeviceCategory(DeviceCategoryType.AC, "Air Conditioner", ""), "", "assets/images/ac_icon.png", "LG 101", 0, 12,
        airConditioner: AirConditionerModel(AirConditionerModes.Cool, 80, 24)),
    DeviceInfoModel(2, DeviceCategory(DeviceCategoryType.AC, "Air Conditioner", ""), "", "assets/images/ac_icon.png", "VD 13", 0, 15,
        airConditioner: AirConditionerModel(AirConditionerModes.Dry, 80, 24)),
    DeviceInfoModel(3, DeviceCategory(DeviceCategoryType.TV, "Television", ""), "", "assets/images/tv.png", "VU 182C", 0, 5,
        television: TelevisionModel(10, TelevisionPictureModes.STANDARD, TelevisionSoundModes.JAZZ))
  ];

  @override
  Future<DashboardModel> getDashboardParams() async {
    return _mockDashboardModel;
  }

  @override
  Future<List<DeviceInfoModel>> getDeviceList() async {
    return _mockDevices;
  }
}
