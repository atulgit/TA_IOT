import 'package:TA_IOT/bloc/data/model/dashboard_model.dart';
import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/data/repository/device_detail_repository.dart';

import '../../common/BaseUseCase.dart';

class GetDashboardUseCase extends BaseUseCase {
  GetDashboardUseCase(DeviceDetailRepository deviceDetailRepository) : super(deviceDetailRepository);

  Future<DashboardModel> getDashboardInfo() async {
    var dashboardInfo = await deviceDetailRepository.getDashboardParams();
    return dashboardInfo;
  }
}
