import 'package:ta_iot/bloc/data/repository/abstract_repository.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseUseCase {
  @protected
  late final AbstractRepository deviceDetailRepository;

  BaseUseCase(this.deviceDetailRepository);
}
