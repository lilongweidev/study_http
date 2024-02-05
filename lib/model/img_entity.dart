import 'package:study_http/generated/json/base/json_field.dart';
import 'package:study_http/generated/json/img_entity.g.dart';
import 'dart:convert';
export 'package:study_http/generated/json/img_entity.g.dart';

@JsonSerializable()
class ImgEntity {
	late String code;
	late String imgurl;
	late String width;
	late String height;

	ImgEntity();

	factory ImgEntity.fromJson(Map<String, dynamic> json) => $ImgEntityFromJson(json);

	Map<String, dynamic> toJson() => $ImgEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}