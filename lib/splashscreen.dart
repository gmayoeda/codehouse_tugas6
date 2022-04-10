// ignore_for_file: must_be_immutable

import 'package:codehouse_tugas6/controller/splachscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  late splashscreenController cx;
  @override
  Widget build(BuildContext context) {
    cx = Get.find<splashscreenController>();
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/news.png',
                fit: BoxFit.cover,
                width: 120,
              ),
              SizedBox(height: 20),
              Text(
                "Im ON NEWS",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              Text(
                "Everydays & Everywhere",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Version 1.0.3',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
            ),
          ],
        ),
      ),
    );
  }
}
