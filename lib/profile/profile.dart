import '../profile/profileheader.dart';
import '../profile/profileaccount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_controller.dart';
import '../profile/otherinfo.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileController x;

  @override
  Widget build(BuildContext context) {
    x = Get.find<ProfileController>();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() =>
                      ProfileHeader(name: x.name.value, email: x.email.value)),
                  SizedBox(height: 36.5),
                  ProfileAccount(),
                  SizedBox(height: 18),
                  OtherInfo(),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.logout_outlined),
                          label: Text("Log Out",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          onPressed: () {
                            x.logout();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFEC5F70),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            minimumSize: Size(324.0, 45.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
