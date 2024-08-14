abstract class ApiConsumer {
  Future<dynamic> getApi(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });

  Future<dynamic> post(String url,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false,
      bool isFormUrlEncoded = false});

  Future<dynamic> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> patch(String url,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false,
      bool isFormUrlEncoded = false});

  Future<dynamic> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
}
