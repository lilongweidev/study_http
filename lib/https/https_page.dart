import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'https_controller.dart';

class HttpsPage extends StatelessWidget {

  final httpsController = Get.put(HttpsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Image.network(
                  httpsController.imgPath.value,
                  width: 200,
                )),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => httpsController.request(),
              child: Text("请求网络"),
            )
          ],
        ),
      ),
    ));
  }
}
