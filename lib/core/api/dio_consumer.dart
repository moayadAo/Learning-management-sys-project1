import 'package:dio/dio.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:learning_system/core/api/api_interceptors.dart';
import 'package:learning_system/core/errors/handle_dio_excpetion.dart';
import 'package:learning_system/core/utils/app_url.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true));
  }
  @override
  Future delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        url,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      HandleDioException(e);
    }
  }

  @override
  Future getApi(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.get(
        url,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      HandleDioException(e);
    }
  }

  @override
  Future patch(String url,
      {data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false,
      bool isFormUrlEncoded = false}) async {
    try {
      final response = await dio.patch(url,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters,
          options: isFormUrlEncoded
              ? Options(contentType: Headers.formUrlEncodedContentType)
              : null);
      return response.data;
    } on DioException catch (e) {
      HandleDioException(e);
    }
  }

  @override
  Future post(String url,
      {data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false,
      bool isFormUrlEncoded = false}) async {
    try {
      final response = await dio.post(url,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters,
          options: isFormUrlEncoded
              ? Options(contentType: Headers.formUrlEncodedContentType)
              : Options(contentType: Headers.jsonContentType));
      return response.data;
    } on DioException catch (e) {
      HandleDioException(e);
    }
  }

  @override
  Future put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      HandleDioException(e);
    }
  }
}
