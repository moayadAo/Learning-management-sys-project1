import 'package:dio/dio.dart';
import 'package:learning_system/core/cache/cache_helper.dart';
import 'package:learning_system/core/services/service_locator.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/app_url.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.authorization] =
        // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWFjaGVySWQiOiI2NmMwNjI0NWQ3ZGExYmJhZDIxYjNkY2QiLCJyb2xlIjoidGVhY2hlciIsImlhdCI6MTcyMzkwMDU5OCwiZXhwIjoxNzI2NDkyNTk4fQ.2a7fTft9GRQcYFgLOJ6fLn46nWu_OkjazbDzze7pnfE';
        getIt<CacheHelper>().getData(key: AppString.token) ?? '';
    // ? getIt<CacheHelper>().getData(key: AppString.token)
    // : null;
    super.onRequest(options, handler);
  }
}
