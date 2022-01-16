/// API provider interface
abstract class ApiProvider {
  final String baseUrl; // base url for api

  /// default constructor for ApiProvider
  /// [baseUrl] - default base url for api
  ApiProvider({required this.baseUrl});

  /// del auth information
  void delAuthHeader();

  /// add auth information
  void setAuthHeader(String token);

  /// GET request to API
  /// [uri] - additional url string to [baseUrl]
  /// [queryParameters] - additional query parameters to request
  Future<T?> get<T>(String uri, {Map<String, dynamic>? queryParameters});

  /// POST request to API
  /// [uri] - additional url string to [baseUrl]
  /// [data] - data for post body
  /// [queryParameters] - additional query parameters to request
  Future<T?> post<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  /// PUT request to API
  /// [uri] - additional url string to [baseUrl]
  /// [data] - data for put body
  /// [queryParameters] - additional query parameters to request
  Future<T?> patch<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
}
