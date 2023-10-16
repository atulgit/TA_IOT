import 'package:TA_IOT/bloc/data/repository/abstract_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../data/repository/device_detail_repository.dart';

abstract class BaseUseCase {
  @protected
  late final AbstractRepository deviceDetailRepository;

  BaseUseCase(this.deviceDetailRepository);
}
