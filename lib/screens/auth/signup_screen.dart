// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:fair_share/constants/colors.dart';
import 'package:fair_share/constants/contant_value.dart';
import 'package:fair_share/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isPasswordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProviderClass>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: splashbackgroundColor,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                      alignment: Alignment.topLeft,
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
                  SizedBox(height: height * .18),
                  const Align(
                    alignment: Alignment.center,
                    child: Text("Create an account",
                        style: TextStyle(color: whiteColor, fontSize: 35)),
                  ),
                  sizedBoxH15,
                  const Align(
                    alignment: Alignment.center,
                    child: Text("Sign up with",
                        style: TextStyle(color: greyColor, fontSize: 18)),
                  ),
                  sizedBoxH15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: greyColorforButton,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/Images/google.png",
                                  height: 35, width: 35),
                              sizedBoxW10,
                              const Text(
                                "Google",
                                style:
                                    TextStyle(color: whiteColor, fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      ),
                      sizedBoxW15,
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: greyColorforButton,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/Images/facebook.png",
                                  height: 35, width: 35),
                              sizedBoxW10,
                              const Text("Facebook",
                                  style: TextStyle(
                                      color: whiteColor, fontSize: 18))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * .05),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("UserName",
                            style: TextStyle(color: whiteColor, fontSize: 18)),
                        sizedBoxW20,
                        SizedBox(
                          width: 200,
                          child: TextFormField(
                            controller: userNameController,
                            decoration: InputDecoration(
                              hintText: "UserName",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: whiteColor)),
                            ),
                            style: TextStyle(color: whiteColor),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter username';
                              }
                              return null;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  sizedBoxH20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Email",
                            style: TextStyle(color: whiteColor, fontSize: 18)),
                        sizedBoxW20,
                        SizedBox(
                          width: 200,
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: "Email",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: whiteColor)),
                            ),
                            style: TextStyle(color: whiteColor),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter email address';
                              }
                              return null;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  sizedBoxH20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Password",
                            style: TextStyle(color: whiteColor, fontSize: 18)),
                        sizedBoxW20,
                        SizedBox(
                          width: 200,
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: !isPasswordVisible,
                            decoration: InputDecoration(
                              hintText: "Password",
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height * .07),
                  Align(
                    alignment: Alignment.center,
                    child: authProvider.isLoading
                        ? CircularProgressIndicator(
                            color: blueButtonColor,
                          )
                        : CupertinoButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * .15,
                                vertical: height * .02),
                            color: blueButtonColor,
                            child: const Text("Register",
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 20,
                                )),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  await authProvider.signUp(
                                    emailController.text,
                                    passwordController.text,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Sign-Up Successful!')),
                                  );
                                  userNameController.clear();
                                  emailController.clear();
                                  passwordController.clear();
                                } on FirebaseAuthException catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.code.toString())),
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "An Unexpected Error Occurred $e")),
                                  );
                                }
                              }
                            }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
