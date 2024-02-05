import 'package:get/get.dart';

import '../model/img_entity.dart';
import '../net/network_manager.dart';
import '../net/response/base_response.dart';

class HttpsController extends GetxController {

  var imgPath =
      "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1h31Ip.img?w=768&h=1226&m=6&x=326&y=887&s=506&d=118"
          .obs;

  void request() async {
    BaseResponse response = await NetworkManager().request('random.php?return=json');
    ImgEntity imgEntity = ImgEntity.fromJson(response.data);
    imgPath.value = imgEntity.imgurl;
  }

}