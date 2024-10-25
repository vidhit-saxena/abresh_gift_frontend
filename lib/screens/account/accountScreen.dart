// import 'package:flutter/material.dart';
// import '../cartScreen.dart'; // Import the CartScreen
// import '../notificationScreen.dart'; // Import the NotificationScreen

// class AccountScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Account', style: TextStyle(fontWeight: FontWeight.bold,),),
//         backgroundColor: Colors.blueAccent,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications_none),
//             onPressed: () {
//               // Navigate to the notification screen
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => NotificationScreen()),
//               );
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.shopping_cart),
//             onPressed: () {
//               // Navigate to the cart screen
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => CartScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Profile Section
//             Container(
//               color: Colors.white,
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   const CircleAvatar(
//                     radius: 40,
//                     backgroundImage: NetworkImage(
//                       'https://via.placeholder.com/150',
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'John Doe',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         'johndoe@gmail.com',
//                         style: TextStyle(fontSize: 14, color: Colors.grey[700]),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         '+91 834 567 8900',
//                         style: TextStyle(fontSize: 14, color: Colors.grey[700]),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         '123 Street , Cal, USA',
//                         style: TextStyle(fontSize: 14, color: Colors.grey[700]),
//                       ),
//                       const SizedBox(height: 16),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Navigate to Edit Profile screen
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => EditProfileScreen()),
//                           );
//                         },
//                         child: const Text('Edit Profile'),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),

//             const SizedBox(height: 10),

//             // Orders Section
//             SectionTitle(title: 'My Orders'),
//             ListTile(
//               leading: const Icon(Icons.shopping_bag, color: Colors.blueAccent),
//               title: const Text('View Orders'),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => OrdersScreen()),
//                 );
//               },
//             ),

//             Divider(height: 1, color: Colors.grey[300]),

//             // Account Settings Section
//             SectionTitle(title: 'Account Settings'),
//             ListTile(
//               leading: const Icon(Icons.home, color: Colors.blueAccent),
//               title: const Text('Manage Addresses'),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => ManageAddressScreen()),
//                 );
//               },
//             ),
//             Divider(height: 1, color: Colors.grey[300]),
//             ListTile(
//               leading: const Icon(Icons.payment, color: Colors.blueAccent),
//               title: const Text('Payment Methods'),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => PaymentMethodsScreen()),
//                 );
//               },
//             ),
//             Divider(height: 1, color: Colors.grey[300]),
//             ListTile(
//               leading: const Icon(Icons.account_box_outlined,
//                   color: Colors.blueAccent),
//               title: const Text('Manage Account'),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => ManageAccountScreen()),
//                 );
//               },
//             ),
//             Divider(height: 1, color: Colors.grey[300]),

//             // Help Section
//             SectionTitle(title: 'Help & Support'),
//             ListTile(
//               leading: const Icon(Icons.help_outline, color: Colors.blueAccent),
//               title: const Text('Help Center'),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => HelpCenterScreen()),
//                 );
//               },
//             ),
//             Divider(height: 1, color: Colors.grey[300]),
//             ListTile(
//               leading: const Icon(Icons.info_outline, color: Colors.blueAccent),
//               title: const Text('About Us'),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => AboutUsScreen()),
//                 );
//               },
//             ),

//             const SizedBox(height: 10),

//             // Logout Button
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Implementing simple logout functionality
//                   Navigator.pop(
//                       context); // For now, just pop the current screen
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
//                 ),
//                 child: const Text('Logout', style: TextStyle(fontSize: 16)),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Section Title Widget
// class SectionTitle extends StatelessWidget {
//   final String title;

//   SectionTitle({required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//       child: Text(
//         title,
//         style: const TextStyle(
//             fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
//       ),
//     );
//   }
// }

// import 'package:abresh_gift_frontend/screens/accountScreen.dart';
// import 'package:abresh_gift_frontend/screens/accountScreen.dart';
import 'package:abresh_gift_frontend/screens/cartScreen.dart';
import 'package:abresh_gift_frontend/screens/notificationScreen.dart';
import 'package:abresh_gift_frontend/screens/signUpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:abresh_gift_frontend/screens/account/AboutUsScreen.dart';
import 'package:abresh_gift_frontend/screens/account/EditProfileScreen.dart';
import 'package:abresh_gift_frontend/screens/account/HelpCenterScreen.dart';
import 'package:abresh_gift_frontend/screens/account/ManageAccountScreen.dart';
import 'package:abresh_gift_frontend/screens/account/ManageAddressScreen.dart';
import 'package:abresh_gift_frontend/screens/account/OrdersScreen.dart';
import 'package:abresh_gift_frontend/screens/account/PaymentMethodsScreen.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String name = "";
  String email = "";
  String phoneNumber = "";
  String address = "";
  String profilePicture = "";

  @override
  void initState() {
    super.initState();
    fetchProfileData(); // Fetch profile data when screen loads
  }

  Future<void> fetchProfileData() async {
    final url = Uri.parse('http://192.168.1.6:5000/api/profile/john@example.com'); // Replace with your API endpoint
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        name = data['name'];
        email = data['email'];
        phoneNumber = data['phoneNumber'];
        address = data['address'];
        profilePicture = data['profilePicture'];
      });
    } else {
      print('Failed to load profile data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // Navigate to the notification screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to the cart screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      profilePicture.isNotEmpty
                          ? profilePicture
                          : 'https://via.placeholder.com/150',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name.isNotEmpty ? name : 'Loading...',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        email.isNotEmpty ? email : 'Loading...',
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        phoneNumber.isNotEmpty ? phoneNumber : 'Loading...',
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        address.isNotEmpty ? address : 'Loading...',
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to Edit Profile screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditProfileScreen()),
                          );
                        },
                        child: const Text('Edit Profile'),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Orders Section
            SectionTitle(title: 'My Orders'),
            ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.blueAccent),
              title: const Text('View Orders'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Assuming userId is stored in a variable
                // final userId = '6511e3f9a882bda5e1d4f123'; // Replace with the actual userId variable
                Navigator.push(context, MaterialPageRoute(builder: (context) => OrderScreen(userId: '6511e3f9a882bda5e1d4f123',)));
              },
            ),

            Divider(height: 1, color: Colors.grey[300]),

            // Account Settings Section
            SectionTitle(title: 'Account Settings'),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blueAccent),
              title: const Text('Manage Addresses'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ManageAddressScreen()));
              },
            ),
            Divider(height: 1, color: Colors.grey[300]),
            ListTile(
              leading: const Icon(Icons.payment, color: Colors.blueAccent),
              title: const Text('Payment Methods'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethodsScreen()));
              },
            ),
            Divider(height: 1, color: Colors.grey[300]),
            ListTile(
              leading: const Icon(Icons.account_box_outlined, color: Colors.blueAccent),
              title: const Text('Manage Account'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ManageAccountScreen()));
              },
            ),
            Divider(height: 1, color: Colors.grey[300]),

            // Help Section
            SectionTitle(title: 'Help & Support'),
            ListTile(
              leading: const Icon(Icons.help_outline, color: Colors.blueAccent),
              title: const Text('Help Center'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HelpCenterScreen()));
              },
            ),
            Divider(height: 1, color: Colors.grey[300]),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.blueAccent),
              title: const Text('About Us'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsScreen()));
              },
            ),

            const SizedBox(height: 10),

            // Logout Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implementing simple logout functionality
                  // Navigator.pop(context); // For now, just pop the current screen
                  _showLogoutDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                ),
                child: const Text('Logout', style: TextStyle(fontSize: 16)),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // Method to show the logout confirmation dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                _logout(context); // Perform logout
              },
              child: Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  // Method to log out the user and redirect to the login screen
  void _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut(); // Firebase sign-out
      // After logout, navigate to the login screen
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => EnhancedSignUpScreen()), // Replace with your login screen
        (Route<dynamic> route) => false, // Clears the backstack
      );
    } catch (e) {
      // Handle any errors that occur during sign-out
      print('Logout Error: $e');
    }
  }

}

// Helper widget to display section titles
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

