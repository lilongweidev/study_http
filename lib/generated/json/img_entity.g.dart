import 'package:study_http/generated/json/base/json_convert_content.dart';
import 'package:study_http/model/img_entity.dart';

ImgEntity $ImgEntityFromJson(Map<String, dynamic> json) {
  final ImgEntity imgEntity = ImgEntity();
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    imgEntity.code = code;
  }
  final String? imgurl = jsonConvert.convert<String>(json['imgurl']);
  if (imgurl != null) {
    imgEntity.imgurl = imgurl;
  }
  final String? width = jsonConvert.convert<String>(json['width']);
  if (width != null) {
    imgEntity.width = width;
  }
  final String? height = jsonConvert.convert<String>(json['height']);
  if (height != null) {
    imgEntity.height = height;
  }
  return imgEntity;
}

Map<String, dynamic> $ImgEntityToJson(ImgEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['imgurl'] = entity.imgurl;
  data['width'] = entity.width;
  data['height'] = entity.height;
  return data;
}

extension ImgEntityExtension on ImgEntity {
  ImgEntity copyWith({
    String? code,
    String? imgurl,
    String? width,
    String? height,
  }) {
    return ImgEntity()
      ..code = code ?? this.code
      ..imgurl = imgurl ?? this.imgurl
      ..width = width ?? this.width
      ..height = height ?? this.height;
  }
}