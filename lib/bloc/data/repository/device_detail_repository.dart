import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/data/provider/device_detail_provider.dart';

import '../model/dashboard_model.dart';

class DeviceDetailRepository {
  DeviceDetailProvider deviceDetailProvider = DeviceDetailProvider();

  Future<List<DeviceInfoModel>> getDeviceList() async {
    return deviceDetailProvider.getDeviceList();
  }

  Future<DashboardModel> getDashboardParams() async {
    return deviceDetailProvider.getDashboardParams();
  }
}
