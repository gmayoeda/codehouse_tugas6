import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxString name = "".obs, email = "".obs;
  void getbox() {
    if (GetStorage().hasData('users')) {
      Map<String, dynamic> users = GetStorage().read('users');
      name.value = users['nama'];
      email.value = users['email'];
      print(name.value);
      print(email.value);
    } else {
      print('no getbox!');
    }
  }

  void logout() {
    Get.defaultDialog(
        title: "Logout",
        textCancel: "Back",
        textConfirm: "Logout",
        confirmTextColor: Colors.white,
        onConfirm: () {
          GetStorage().erase();
          Get.snackbar(
            "Sign-out Success",
            "Thanks, ${name}.",
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
          Get.offNamed("/signin");
        },
        barrierDismissible: false,
        radius: 10,
        content: Text('Yakin akan keluar?'));
  }

  @override
  void onReady() {
    getbox();
    super.onReady();
  }
}
