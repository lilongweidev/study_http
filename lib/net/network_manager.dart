import 'package:dio/dio.dart';
import 'package:study_http/net/method/base_method.dart';

import 'interceptor/custom_interceptor.dart';

/// 网络管理
class NetworkManager {

  factory NetworkManager() => _getInstance();
  static NetworkManager? _instance = NetworkManager._initialize();
  final _mBaseUrl = "https://www.dmoe.cc/";
  late Dio _dio;

  static NetworkManager _getInstance() {
    _instance ??= NetworkManager._initialize();
    return _instance!;
  }

  NetworkManager._initialize() {
    // 配置BaseOptions
    BaseOptions options = BaseOptions(
        baseUrl: _mBaseUrl,
        //连接超时
        connectTimeout: const Duration(seconds: 15),
        //接收超时
        receiveTimeout: const Duration(seconds: 10),
        //内容类型
        contentType: 'application/json;Charset=UTF-8',
        //响应数据类型：Json
        responseType: ResponseType.json);
    _dio = Dio(options);
    //添加日志拦截器
    _dio.interceptors.add(CustomInterceptor());
  }

  ///网络请求
  Future<T> request<T>(String path,
      {BaseMethod method = BaseMethod.get, Map<String, dynamic>? params,
      data, Options? options}) async {
    const methodValues = {
      BaseMethod.get: 'get',
      BaseMethod.post: 'post',
      BaseMethod.put: 'put',
      BaseMethod.delete: 'delete',
      BaseMethod.patch: 'patch',
      BaseMethod.head: 'head',
    };

    options ??= Options(method: methodValues[method]);
    try {
      Response response;
      response = await _dio.request(path,
          data: data, queryParameters: params, options: options);
      return response.data;
    } on DioException catch (e) {
      throw e;
    }
  }
}
