import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:logger/logger.dart';

class ApiService extends GetxService {
  var dio = Dio();
  var logger = Logger(
    printer: PrettyPrinter(),
  );
  var loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );


  String get apiHost => 'https://dapi.kakao.com';

  String get apiKey => 'KakaoAK 436837e33ca8922d8296ac3785d4e072';

  Future<ApiService> init() async {
    //기본 url 인터셉터에 탑제
    dio.options.baseUrl = '$apiHost/';

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      loggerNoStack.v(options.data);
      options.headers = headers; //request시에 header 탑재
      logger.i(options.headers);
      logger.i(options.uri);
      return handler.next(options);
    }, onResponse: (response, handler) {
      loggerNoStack.v(response.statusCode);
      loggerNoStack.v(response.data);

      return handler.next(response);
    }, onError: (DioError exception, handler) {
      logger.e(
          "statusCode : ${exception.response?.statusCode} \n statusMessage : ${exception.message}");

      return handler.next(exception);
    }));

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
