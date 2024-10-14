import 'package:flutter/material.dart';
import 'package:abresh_gift_frontend/screens/splashScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      // home: EnhancedSignUpScreen(),
      // home: ProductDetailScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

