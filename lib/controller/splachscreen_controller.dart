import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../custom/bottomnav.dart';

class splashscreenController extends GetxController {
  selection() {
    return Timer(Duration(seconds: 3), () {
      if (GetStorage().hasData("users")) {
        // Get.offAllNamed("/home");
        Get.offAll(BottomNav());
      } else {
        Get.offAndToNamed("/signin");
      }
    });
  }

  @override
  void onReady() {
    selection();
    super.onReady();
  }
}
