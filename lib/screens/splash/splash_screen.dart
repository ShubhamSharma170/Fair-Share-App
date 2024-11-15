import 'package:fair_share/constants/colors.dart';
import 'package:fair_share/constants/contant_value.dart';
import 'package:fair_share/screens/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: splashbackgroundColor,
        body: Stack(children: [
          Positioned.fill(
              child: Image.asset("assets/Images/splash_screen.jpg",
                  fit: BoxFit.cover)),
          Positioned(
              child: Column(
            children: [
              SizedBox(height: height * .75),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wallet, color: whiteColor, size: 50),
                  SizedBox(width: 10),
                  Text("Fair-Share",
                      style: TextStyle(color: whiteColor, fontSize: 30))
                ],
              ),
              const Text("Keeping expenses easy, together.",
                  style: TextStyle(color: greyColor, fontSize: 18)),
              sizedBoxH15,
              CupertinoButton(
                  color: blueButtonColor,
                  child: const Text("Get Started",
                      style: TextStyle(
                        color: whiteColor,
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const LoginScreen()));
                  })
            ],
          ))
        ]),
      ),
    );
  }
}
