import 'package:ta_iot/bloc/data/model/device_model.dart';
import 'package:ta_iot/bloc/data/provider/device_detail_provider.dart';
import 'package:ta_iot/bloc/data/repository/abstract_repository.dart';

import '../model/dashboard_model.dart';

class DeviceDetailRepository extends AbstractRepository {
  DeviceDetailProvider deviceDetailProvider = DeviceDetailProvider();

  @override
  Future<List<DeviceInfoModel>> getDeviceList() async {
    return deviceDetailProvider.getDeviceList();
  }

  @override
  Future<DashboardModel> getDashboardParams() async {
    return deviceDetailProvider.getDashboardParams();
  }
}
