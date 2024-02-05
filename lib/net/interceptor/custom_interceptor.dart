import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:study_http/net/response/base_response.dart';

///日志拦截器
class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    StringBuffer buffer = StringBuffer();
    buffer.write('⌈‾‾ Request ヾ(•ω•`)o \n');
    buffer.write('| \n');
    buffer.write('| - Url：   ${options.baseUrl + options.path}\n');
    buffer.write('| - Method：${options.method}\n');
    buffer.write('| - Header：${options.headers.toString()}\n');
    final data = options.data;
    if (data != null) {
      if (data is Map) {
        buffer.write('| - Body：  ${options.data.toString()}\n');
      } else if (data is FormData) {
        final formDataMap = {}
          ..addEntries(data.fields)
          ..addEntries(data.files);
        buffer.write("| - Body：  ${formDataMap.toString()}\n");
      } else {
        buffer.write("| - Body：  ${data.toString()}\n");
      }
    }
    buffer.write(
        '⌊_____________________________________________________________________');
    printDebugLog(buffer);
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //返回自定义的Base
    final baseResponse = BaseResponse(code: response.statusCode, msg: response.statusMessage, data: response.data);
    response.data = baseResponse;

    StringBuffer buffer = StringBuffer();
    buffer.write('⌈‾‾ Response O(∩_∩)O \n');
    buffer.write('| \n');
    buffer.write('| - Code：   ${response.statusCode}\n');
    buffer.write('| - CodeMsg：${response.statusMessage}\n');
    buffer.write('| - Header：\n');
    response.headers.forEach((key, value) {
      buffer.write('|    $key  $value\n');
    });
    final data = response.data;
    if (data != null) {
      if (data is Map) {
        buffer.write('| - Data：  ${response.data.toString()}\n');
        String dataJson = jsonEncode(response.data);
        buffer.write('| - Json：  $dataJson\n');
      } else if (data is FormData) {
        final formDataMap = {}
          ..addEntries(data.fields)
          ..addEntries(data.files);
        buffer.write("| - Data：  ${formDataMap.toString()}\n");
      } else {
        buffer.write("| - Data：  ${baseResponse.data.toString()}\n");
      }
    }
    buffer.write(
        '⌊_____________________________________________________________________');
    printDebugLog(buffer);
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    //处理错误信息
    handlerError(err);
    StringBuffer buffer = StringBuffer();
    buffer.write('⌈‾‾ Error (っ °Д °;)っ\n');
    buffer.write('| \n');
    buffer.write('| - ExceptionType：${err.type.name}\n');
    buffer.write('| - ErrorMsg：     ${err.message}\n');
    buffer.write('| - StatusCode：   ${err.response?.statusCode}\n');
    buffer.write('| - StatusMsg：    ${err.response?.statusMessage}\n');
    buffer.write(
        '⌊_____________________________________________________________________');
    printDebugLog(buffer);
    return handler.next(err);
  }

  ///处理错误信息 --自行去实现里面的功能代码
  void handlerError(DioException err) {
    switch (err.type) {
      //连接超时
      case DioExceptionType.connectionTimeout:
        break;
      //响应超时
      case DioExceptionType.receiveTimeout:
        break;
      //发送超时
      case DioExceptionType.sendTimeout:
        break;
      //请求取消
      case DioExceptionType.cancel:
        break;
      //错误响应 404 等
      case DioExceptionType.badResponse:
        break;
      //错误证书
      case DioExceptionType.badCertificate:
        break;
      //未知错误
      default:
        break;
    }
  }

  void printDebugLog(StringBuffer buffer) {
    if (kDebugMode) {
      print(buffer.toString());
    }
  }
}
