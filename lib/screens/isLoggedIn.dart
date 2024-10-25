import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IsLoggedIn {
  // Function to check login status (based on local storage or other backend logic)
  Future<bool> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false; // Default is false if no login data
  }

  // Function to show login popup if not logged in
  void showLoginPopup(BuildContext context, Function onSuccess) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text('M'), // Avatar can be customized
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Login to Your App', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('Continue with phone number'),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.language),
                      onPressed: () {
                        // Language switch logic here
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    // Simulate login
                    await _loginUser();
                    Navigator.pop(context); // Close dialog after login
                    onSuccess(); // Call the success callback to continue with the action
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: const Text('CONTINUE', style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigate to manual login screen if required
                  },
                  child: const Text('ENTER DETAILS MANUALLY'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Function to simulate user login and save status
  Future<void> _loginUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true); // Set login status to true
  }
}
