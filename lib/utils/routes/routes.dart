import 'package:fair_share/constants/colors.dart';
import 'package:fair_share/screens/auth/login_screen.dart';
import 'package:fair_share/screens/auth/signup_screen.dart';
import 'package:fair_share/screens/home/home_screen.dart';
import 'package:fair_share/screens/splash/splash_screen.dart';
import 'package:fair_share/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext contetx) => SplashScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext contetx) => LoginScreen());
      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext contetx) => SignupScreen());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext contetx) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            backgroundColor: splashbackgroundColor,
            body: Center(
              child: Text(
                "No Route Found",
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
    }
  }
}
