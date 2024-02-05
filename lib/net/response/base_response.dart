///自定义响应封装
class BaseResponse<T> {
  //状态码
  final int? code;
  //状态描述
  final String? msg;
  //数据
  final T data;

  BaseResponse({required this.code,required this.msg,required this.data});

  @override
  String toString() {
    StringBuffer buffer = StringBuffer();
    buffer.write('{');
    buffer.write('"code":$code');
    buffer.write('"msg":"$msg"');
    buffer.write('"data":"$data"');
    buffer.write('}');
    return super.toString();
  }
}