import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'homeScreen.dart';

class EmailAuthScreen extends StatefulWidget {
  @override
  _EmailAuthScreenState createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends State<EmailAuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLogin = true; // Tracks whether we are in login or registration mode
  String _statusMessage = ""; // To show feedback messages to the user

  // Register user and send verification email
  Future<void> _register() async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      User? user = userCredential.user;

      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        setState(() {
          _statusMessage = "Verification email sent to ${user.email}.";
        });
      }
    } catch (e) {
      setState(() {
        _statusMessage = "Registration failed: $e";
      });
    }
  }

  // Log in the user
  Future<void> _login() async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      User? user = userCredential.user;

      if (user != null && user.emailVerified) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else if (user != null && !user.emailVerified) {
        setState(() {
          _statusMessage = "Email not verified. Please verify.";
        });
      }
    } catch (e) {
      setState(() {
        _statusMessage = "Login failed: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(_isLogin ? 'Login' : 'Register'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Adding a logo or image at the top
              SizedBox(height: 20),
              Image.asset(
                'assets/app_logo.png', // Ensure you have an image asset
                height: 150,
              ),
              SizedBox(height: 30),
              // Email Text Field
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Enter Email',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              // Password Text Field
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 30),
              // Login/Register Button
              ElevatedButton(
                onPressed: _isLogin ? _login : _register,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Text(
                    _isLogin ? 'Login' : 'Register',
                    style: TextStyle(
                      fontSize: 18.0, // Increase this value for larger text
                      fontWeight:
                          FontWeight.bold, // Optional: to make the text bold
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 15),
              // Toggle between login and register
              TextButton(
                onPressed: () {
                  setState(() {
                    _isLogin = !_isLogin;
                  });
                },
                child: Text(
                  _isLogin
                      ? 'Create Account'
                      : 'Already have an account? Login',
                  style: TextStyle(color: Colors.orangeAccent, fontSize: 16.0),
                ),
              ),
              SizedBox(height: 20),
              // Status Message
              if (_statusMessage.isNotEmpty)
                Text(
                  _statusMessage,
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'homeScreen.dart';

// class EmailAuthScreen extends StatefulWidget {
//   @override
//   _EmailAuthScreenState createState() => _EmailAuthScreenState();
// }

// class _EmailAuthScreenState extends State<EmailAuthScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLogin = true; // Tracks whether we are in login or registration mode
//   String _statusMessage = ""; // To show feedback messages to the user

//   // Register user and send verification email
//   Future<void> _register() async {
//     try {
//       // Create a user with email and password
//       final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passwordController.text,
//       );
//       User? user = userCredential.user;

//       // Send email verification if user registration is successful
//       if (user != null && !user.emailVerified) {
//         await user.sendEmailVerification();
//         setState(() {
//           _statusMessage = "Verification email sent to ${user.email}.";
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _statusMessage = "Registration failed: $e";
//       });
//     }
//   }

//   // Log in the user
//   Future<void> _login() async {
//     try {
//       // Sign in user with email and password
//       final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passwordController.text,
//       );
//       User? user = userCredential.user;

//       // Check if user is verified before navigating to HomePage
//       if (user != null && user.emailVerified) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HomeScreen(),
//           ),
//         );
//       } else if (user != null && !user.emailVerified) {
//         setState(() {
//           _statusMessage = "Email not verified. Please verify.";
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _statusMessage = "Login failed: $e";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_isLogin ? 'Login' : 'Register'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Enter Email',
//               ),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(
//                 labelText: 'Enter Password',
//               ),
//               obscureText: true,
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _isLogin ? _login : _register,
//               child: Text(_isLogin ? 'Login' : 'Register'),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   _isLogin = !_isLogin;
//                 });
//               },
//               child: Text(_isLogin ? 'Create Account' : 'Already have an account? Login'),
//             ),
//             SizedBox(height: 16),
//             Text(
//               _statusMessage,
//               style: TextStyle(color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
