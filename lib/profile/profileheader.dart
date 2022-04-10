import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_controller.dart';

class ProfileHeader extends StatefulWidget {
  final String name;
  final String email;

  ProfileHeader({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  late ProfileController x;

  @override
  Widget build(BuildContext context) {
    x = Get.find<ProfileController>();
    return Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage("assets/images/Ellipse.png"),
          ),
          SizedBox(height: 6),
          Text(
            x.name.toString().toUpperCase(),
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w300),
          ),
          // SizedBox(height: 6),
          // Text(
          //   '+62123456789',
          //   textAlign: TextAlign.start,
          //   style: TextStyle(
          //       fontStyle: FontStyle.italic,
          //       color: Colors.black,
          //       fontSize: 12,
          //       fontWeight: FontWeight.w400),
          // ),
          SizedBox(height: 6),
          Text(
            widget.email,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
