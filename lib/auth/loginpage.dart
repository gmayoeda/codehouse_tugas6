// import '../home.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controller/signin_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late signinController cx;
  @override
  Widget build(BuildContext context) {
    cx = Get.find<signinController>();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(18, 40, 18, 34),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Log in',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Sign In to continue',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 28),
                    Text(
                      'Username',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Container(
                      height: 45,
                      margin: new EdgeInsets.only(top: 8.0),
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Color(0xFFA9BCCF).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: cx.user,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: 'Username',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Password',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Container(
                      height: 45,
                      margin: new EdgeInsets.only(top: 8.0),
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Color(0xFFA9BCCF).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: cx.pass,
                        keyboardType: TextInputType.text,
                        obscureText: cx.secureText,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                cx.Login();
                              },
                              style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                minimumSize: Size(324.0, 45.0),
                              ),
                              child: Text("Log in",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ",
                      style: TextStyle(
                          color: Color(0xFF6A6A6A),
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                  InkWell(
                    onTap: () {
                      Get.toNamed("/signup");
                    },
                    child: Text("Sign up",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
