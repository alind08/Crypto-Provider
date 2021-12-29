import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class ApiClient {
  static bool apiDebuggin = true;
  static Dio? dio;
  static const String baseUrl = 'https://api.coincap.io/v2/';

  static Dio? getClient() {
    if (dio == null) {
      BaseOptions baseOptions = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 60000,
        receiveTimeout: 60000,
        // headers: {
        //   'x-rapidapi-host': 'api-nba-v1.p.rapidapi.com',
        //   'x-rapidapi-key': '2ce6b712c8msh23cc9255508e0aep11df74jsn3864a974c2fc'
        // },
        contentType: 'application/json',
        responseType: ResponseType.json,

      );

      dio = Dio(baseOptions);

      dio!.interceptors.add(InterceptorsWrapper(
        onRequest: (options,requestInterceptorHandler) {
          log("$options");
          return requestInterceptorHandler.next(options);

        },
        onResponse: (response,responseInterceptorHandler) {
          if (apiDebuggin) {
            debugDioResponse(response);
          }
          return responseInterceptorHandler.next(response);
          // log(response); // continue
        },
        onError: (e,errorInterceptorHandler) {
          if (apiDebuggin) {
            debugDioError(e);
          }
          log("$e");
          return errorInterceptorHandler.next(e);
          //continue
        },
      ));
    }
    return dio;
  }

  static void clean() {
    dio = null;
  }

  static void debugDioError(DioError error) {
    log("+++++++++++++++Request++++++++++++++++++++");
    log("Url - " + error.requestOptions.baseUrl + error.requestOptions.path);
    log("Type - " + error.requestOptions.method);
    log("Headers - " + error.requestOptions.headers.toString());
    log("Request - " + jsonEncode(error.requestOptions.data));
    log("QueryParameters - " + error.requestOptions.queryParameters.toString());
    log("+++++++++++++++++++++++++++++++++++");

    if (error.response != null) {
      log("+++++++++++++++Response++++++++++++++++++++");
      log("Response Code - " + error.response!.statusCode.toString());
      log("Response - " + error.response!.data.toString());
      log("+++++++++++++++++++++++++++++++++++");
    } else {
      log("+++++++++++++++Response NULL++++++++++++++++++++");
    }

    log("+++++++++++++++Stack Trace++++++++++++++++++++");
    log("StackTrace - " + error.toString());
    log("+++++++++++++++++++++++++++++++++++");
  }

  static void debugDioResponse(Response response) {
    log("+++++++++++++++Request++++++++++++++++++++");
    log("Url - " + response.requestOptions.baseUrl + response.requestOptions.path);
    log("Type - " + response.requestOptions.method);
    log("Headers - " + jsonEncode(response.requestOptions.headers));
    log("Request - " + jsonEncode(response.requestOptions.data));
    log(
        "QueryParameters - " + response.requestOptions.queryParameters.toString());
    log("+++++++++++++++++++++++++++++++++++");

    log("+++++++++++++++Response++++++++++++++++++++");
    log("Response Code - " + response.statusCode.toString());
    log("Response - " + jsonEncode(response.data));
    log("+++++++++++++++++++++++++++++++++++");
  }
}
