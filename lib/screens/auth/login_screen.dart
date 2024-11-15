// ignore_for_file: unused_local_variable

import 'package:fair_share/constants/colors.dart';
import 'package:fair_share/constants/contant_value.dart';
import 'package:fair_share/screens/auth/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: splashbackgroundColor,
        body: Stack(children: [
          Positioned.fill(
            child: Image.asset("assets/Images/login.jpg", fit: BoxFit.cover),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  border: Border.all(color: whiteColor),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(Icons.keyboard_arrow_left_outlined,
                    color: whiteColor),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                  color: splashbackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text("Login",
                        style: TextStyle(color: whiteColor, fontSize: 50)),
                  ),
                  sizedBoxH20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Email",
                            style: TextStyle(color: whiteColor, fontSize: 18)),
                        sizedBoxW20,
                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(color: whiteColor),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: whiteColor)),
                            ),
                            style: TextStyle(color: whiteColor),
                          ),
                        )
                      ],
                    ),
                  ),
                  sizedBoxH15,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Password",
                            style: TextStyle(color: whiteColor, fontSize: 18)),
                        sizedBoxW20,
                        SizedBox(
                          width: 200,
                          child: TextField(
                            obscureText: !isPasswordVisible,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(color: whiteColor),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: whiteColor)),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                                child: Icon(
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                            style: TextStyle(color: whiteColor),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height * .05),
                  Align(
                    alignment: Alignment.center,
                    child: CupertinoButton(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * .15, vertical: height * .02),
                        color: blueButtonColor,
                        child: const Text("Login",
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: 20,
                            )),
                        onPressed: () {}),
                  ),
                  SizedBox(height: height * .04),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const SignupScreen()));
                      },
                      child: Text("Don't have an account ?",
                          style:
                              TextStyle(color: blueButtonColor, fontSize: 20)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
