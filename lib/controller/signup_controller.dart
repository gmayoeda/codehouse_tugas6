import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class signupController extends GetxController {
  bool secureText = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final box = GetStorage();

  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void setbox() async {
    if (namaController.text == "" ||
        emailController.text == "" ||
        passController.text == "") {
      Get.defaultDialog(
          title: "Warning",
          textCancel: "Back",
          barrierDismissible: false,
          radius: 10,
          content: Text('Cek kembali inputan!'));
    } else {
      Map<String, dynamic> user = {
        "nama": namaController.text,
        "email": emailController.text,
        "password": passController.text,
      };
      box.write('users', user).then((value) {
        Get.offNamedUntil("/signin", (route) => false);
      });
    }
  }

  @override
  void onReady() {
    secureText = !secureText;
    super.onReady();
  }
}
