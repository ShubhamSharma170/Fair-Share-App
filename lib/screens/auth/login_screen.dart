// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:fair_share/constants/colors.dart';
import 'package:fair_share/constants/contant_value.dart';
import 'package:fair_share/providers/auth_provider.dart';
import 'package:fair_share/screens/auth/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
          child: Stack(children: [
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                              style:
                                  TextStyle(color: whiteColor, fontSize: 18)),
                          sizedBoxW20,
                          SizedBox(
                            width: 200,
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(color: whiteColor),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: whiteColor)),
                              ),
                              style: TextStyle(color: whiteColor),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter email";
                                }
                                return null;
                              },
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
                              style:
                                  TextStyle(color: whiteColor, fontSize: 18)),
                          sizedBoxW20,
                          SizedBox(
                            width: 200,
                            child: TextFormField(
                              controller: passwordController,
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter password";
                                }
                                return null;
                              },
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
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                await authProvider.signIn(
                                    emailController.text.trim(),
                                    passwordController.text.trim());
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Login successful!"),
                                  ),
                                );
                              } on FirebaseAuthException catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(e.code.toString()),
                                  ),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text("Un expected error occurred!"),
                                  ),
                                );
                              }
                            }
                          }),
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
                            style: TextStyle(
                                color: blueButtonColor, fontSize: 20)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
