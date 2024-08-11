import 'package:dio/dio.dart';
import 'package:learning_system/core/cache/cache_helper.dart';
import 'package:learning_system/core/services/service_locator.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/app_url.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.authorization] =
        getIt<CacheHelper>().getData(key: AppString.token) ?? '';
    // ? getIt<CacheHelper>().getData(key: AppString.token)
    // : null;
    super.onRequest(options, handler);
  }
}
