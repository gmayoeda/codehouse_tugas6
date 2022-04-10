import 'package:codehouse_tugas6/route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Codehouse TUGAS-6',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // initialBinding: Injector(),
      initialRoute: "/splashscreen",
      getPages: pageRoute.pages,

      // home: LoginPage(),
    );
  }
}
