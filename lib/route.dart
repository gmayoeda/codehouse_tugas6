import 'package:codehouse_tugas6/auth/signuppage.dart';
import 'package:codehouse_tugas6/home.dart';
import 'package:codehouse_tugas6/profile/profile.dart';
import 'package:codehouse_tugas6/splashscreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../injector.dart';
import 'auth/loginpage.dart';

class pageRoute {
  static final pages = [
    GetPage(
      name: "/splashscreen",
      page: () => SplashScreen(),
      binding: Injector(),
    ),
    GetPage(
      name: "/signup",
      page: () => SignupPage(),
      binding: Injector(),
    ),
    GetPage(
      name: "/signin",
      page: () => LoginPage(),
      binding: Injector(),
    ),
    GetPage(
      name: "/home",
      page: () => HomePage(),
      binding: Injector(),
    ),
    GetPage(
      name: "/profile",
      page: () => ProfilePage(),
      binding: Injector(),
    ),
  ];
}
