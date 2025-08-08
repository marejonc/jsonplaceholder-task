import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tcb_recru_task/core/injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.init();
}
