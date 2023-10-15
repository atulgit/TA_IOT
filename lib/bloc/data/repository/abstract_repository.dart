import '../model/dashboard_model.dart';
import '../model/device_model.dart';

abstract class AbstractRepository {
  Future<List<DeviceInfoModel>> getDeviceList();
  Future<DashboardModel> getDashboardParams();
}