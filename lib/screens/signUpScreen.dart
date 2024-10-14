import 'package:abresh_gift_frontend/main.dart';
import 'package:abresh_gift_frontend/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EnhancedSignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.blueAccent),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top illustration or branding
              Center(
                child: Image.asset(
                  'assets/app_logo.png', // Replace with actual image path
                  height: 220.0,
                ),
              ),
              const SizedBox(height: 25.0),
              
              // Welcome message
              const Text(
                'Welcome to ABRGifts!',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              
              const Text(
                'Sign up to start exploring amazing deals.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50.0),
              
              // Google Sign-up Button
              // ElevatedButton.icon(
              //   onPressed: () {
              //     // Handle Google sign-up logic here
              //     _signUpWithGoogle(context);
              //   },
              //   icon: FaIcon(FontAwesomeIcons.google, color: Colors.white),
              //   label: Text(
              //     'Continue with Google',
              //     style: TextStyle(color: Colors.white, fontSize: 16.0),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.blueAccent,
              //     padding: EdgeInsets.symmetric(vertical: 15.0),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //   ),
              // ),
              // SizedBox(height: 20.0),
              
              // Phone Number Sign-up Button
              ElevatedButton.icon(
                onPressed: () {
                  // Handle Phone number sign-up logic here
                  _signUpWithPhoneNumber(context);
                },
                icon: const Icon(Icons.phone, color: Colors.white),
                label: const Text(
                  'Continue with Phone Number',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              
              // Or divider
              const Row(
                children: [
                  Expanded(child: Divider(color: Colors.white)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'OR',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 30.0),

              // Skip for now Text
              GestureDetector(
                onTap: () {
                  // Handle skip to home
                  _navigateToHome(context);
                },
                child: const Text(
                  'Skip for now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    // decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20.0),
              
              // Terms & Conditions
              const Padding(
                padding: EdgeInsets.only(top: 100.0, left: 8.0, right: 8.0, bottom: 8.0),
                child: Text(
                  'By continuing, you agree to ABRGift’s\nTerms & Conditions and Privacy Policy',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Navigate to home screen after skipping
  void _navigateToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()), // Replace with your home screen
    );
  }

  // Google sign-up handler
  void _signUpWithGoogle(BuildContext context) {
    // TODO: Implement Google sign-up logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Google sign-up clicked')),
    );
  }

  // Phone number sign-up handler
  void _signUpWithPhoneNumber(BuildContext context) {
    // TODO: Implement Phone number sign-up logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Phone number sign-up clicked')),
    );
  }
}

