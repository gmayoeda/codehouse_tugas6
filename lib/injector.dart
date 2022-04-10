import 'package:codehouse_tugas6/controller/signup_controller.dart';
import 'package:codehouse_tugas6/controller/splachscreen_controller.dart';
import 'package:get/get.dart';

import 'controller/home_controller.dart';
import 'controller/profile_controller.dart';
import 'controller/signin_controller.dart';
import 'repository/repository.dart';

class Injector extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => splashscreenController());
    Get.lazyPut(() => signinController());
    Get.lazyPut(() => signupController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => NewsRepository());
  }
}
