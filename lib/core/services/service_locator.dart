import 'package:get_it/get_it.dart';
import 'package:learning_system/core/cache/cache_helper.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
}
