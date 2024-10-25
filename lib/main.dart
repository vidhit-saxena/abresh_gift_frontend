import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:abresh_gift_frontend/screens/splashScreen.dart';
import 'package:get/get.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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

