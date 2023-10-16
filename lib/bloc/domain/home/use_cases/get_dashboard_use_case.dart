import 'package:ta_iot/bloc/data/model/dashboard_model.dart';

import '../../../data/repository/abstract_repository.dart';
import '../../common/base_use_case.dart';

class GetDashboardUseCase extends BaseUseCase {
  GetDashboardUseCase(AbstractRepository deviceDetailRepository) : super(deviceDetailRepository);

  Future<DashboardModel> getDashboardInfo() async {
    var dashboardInfo = await deviceDetailRepository.getDashboardParams();
    return dashboardInfo;
  }
}
