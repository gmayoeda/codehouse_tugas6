import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../custom/bottomnav.dart';

class signinController extends GetxController {
  bool secureText = true;
  RxString name = "".obs, email = "".obs, password = "".obs;

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  void getbox() {
    if (GetStorage().hasData('users')) {
      Map<String, dynamic> users = GetStorage().read('users');
      name.value = users['nama'];
      email.value = users['email'];
      password.value = users['password'];

      user = TextEditingController(text: name.value);
      pass = TextEditingController(text: password.value);
      print(name.value);
      print(email.value);
      print(password.value);
    } else {
      print('no getbox!');
    }
  }

  void Login() {
    if (user.text.isEmpty && pass.text.isEmpty) {
      Get.defaultDialog(
          title: "Warning",
          textCancel: "Back",
          barrierDismissible: false,
          radius: 10,
          content: Text('Cek kembali inputan!'));
    } else {
      if (user.text == name.value && pass.text == password.value) {
        Get.snackbar(
          "Sign-in Success",
          "Welcome back, ${name}.",
          icon: Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.teal,
          borderRadius: 10,
          margin: EdgeInsets.all(15),
          colorText: Colors.white,
          duration: Duration(seconds: 4),
          isDismissible: true,
          // dismissDirection: SnackDismissDirection.HORIZONTAL,
          forwardAnimationCurve: Curves.easeOutBack,
        );
        Get.offAll(BottomNav());
      } else {
        Get.defaultDialog(
            title: "Warning",
            textCancel: "Back",
            barrierDismissible: false,
            radius: 10,
            content: Text('Data user tidak sesuai!'));
      }
    }
  }

  @override
  void onReady() {
    getbox();
    super.onReady();
  }
}
