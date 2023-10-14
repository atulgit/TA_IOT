import 'package:flutter/cupertino.dart';

import '../../data/repository/device_detail_repository.dart';

abstract class BaseUseCase {
  @protected
  late final DeviceDetailRepository deviceDetailRepository;

  BaseUseCase(this.deviceDetailRepository);
}
