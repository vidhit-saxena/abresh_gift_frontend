// import 'package:abresh_gift_frontend/main.dart';
import 'package:abresh_gift_frontend/screens/signUpScreen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => EnhancedSignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/app_logo.png'),  // Your logo here
      ),
    );
  }
}


