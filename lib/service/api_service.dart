import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';

class ApiService extends GetxService {
  var dio = Dio();

  String get apiHost => 'https://dapi.kakao.com';
  String get apiKey => 'KakaoAK 436837e33ca8922d8296ac3785d4e072';

  Future<ApiService> init() async {
    dio.options.baseUrl = '$apiHost/';

    dio.interceptors.add(LogInterceptor());

// CustomLog
    //dio.interceptors.add(CustomLogInterceptor());

    return this;

  }


  Map<String, String> get headers {
    Map<String, String> headers = {};
    headers['Authorization'] = apiKey;
    headers['content-type'] = 'application/json; charset=utf-8';
    return headers;
  }

  Future<Response> getWithHeader(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.get(url,
        queryParameters: queryParameters, options: Options(headers: headers));

  }

}


class CustomLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    super.onError(err, handler);
  }
}