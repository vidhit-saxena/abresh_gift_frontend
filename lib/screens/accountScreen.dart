import 'package:flutter/material.dart';
import 'cartScreen.dart'; // Import the CartScreen
import 'notificationScreen.dart'; // Import the NotificationScreen

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              // Navigate to the notification screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to the cart screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
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
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150',
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'johndoe@gmail.com',
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '+91 834 567 8900',
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 10),

            // Orders Section
            SectionTitle(title: 'My Orders'),
            ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.blueAccent),
              title: const Text('View Orders'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrdersScreen()),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ManageAddressScreen()),
                );
              },
            ),
            Divider(height: 1, color: Colors.grey[300]),
            ListTile(
              leading: const Icon(Icons.payment, color: Colors.blueAccent),
              title: const Text('Payment Methods'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentMethodsScreen()),
                );
              },
            ),
            Divider(height: 1, color: Colors.grey[300]),
            ListTile(
              leading: const Icon(Icons.account_box_outlined, color: Colors.blueAccent),
              title: const Text('Manage Account'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ManageAccountScreen()),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpCenterScreen()),
                );
              },
            ),
            Divider(height: 1, color: Colors.grey[300]),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.blueAccent),
              title: const Text('About Us'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen()),
                );
              },
            ),

            SizedBox(height: 10),

            // Logout Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implementing simple logout functionality
                  Navigator.pop(context); // For now, just pop the current screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                ),
                child: const Text('Logout', style: TextStyle(fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Section Title Widget
class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
      ),
    );
  }
}

// Dummy Screens for Orders, Address, Payment, Account, Help and About Us
class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Orders')),
      body: Center(child: Text('Orders list goes here')),
    );
  }
}

class ManageAddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Addresses')),
      body: Center(child: Text('Addresses management goes here')),
    );
  }
}

class PaymentMethodsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Methods')),
      body: Center(child: Text('Payment methods management goes here')),
    );
  }
}

class ManageAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Account')),
      body: Center(child: Text('Account management goes here')),
    );
  }
}

class HelpCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help Center')),
      body: Center(child: Text('Help and support information goes here')),
    );
  }
}

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Us')),
      body: Center(child: Text('Information about the company goes here')),
    );
  }
}





// import 'package:abresh_gift_frontend/screens/cartScreen.dart';
// import 'package:abresh_gift_frontend/screens/notificationScreen.dart';
// import 'package:flutter/material.dart';

// class AccountScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Account'),
//         backgroundColor: Colors.blueAccent,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications_none),
//             onPressed: () {
//               // TODO: Navigate to notifications screen
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => NotificationScreen(),
//                 ),
//               );
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               // TODO: Navigate to cart screen
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => CartScreen(),
//                 ),
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
//               padding: EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundImage: NetworkImage(
//                       'https://via.placeholder.com/150',
//                     ),
//                   ),
//                   SizedBox(width: 20),
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
//                     ],
//                   )
//                 ],
//               ),
//             ),

//             SizedBox(height: 10),

//             // Orders Section
//             SectionTitle(title: 'My Orders'),
//             ListTile(
//               leading: const Icon(Icons.shopping_bag, color: Colors.blueAccent),
//               title: const Text('View Orders'),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 // TODO: Navigate to order history screen
//               },
//             ),

//             Divider(height: 1, color: Colors.grey[300]),

//             // Account Settings
//             SectionTitle(title: 'Account Settings'),
//             ListTile(
//               leading: const Icon(Icons.home, color: Colors.blueAccent),
//               title: const Text('Manage Addresses'),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 // TODO: Navigate to manage addresses screen
//               },
//             ),
//             Divider(height: 1, color: Colors.grey[300]),
//             ListTile(
//               leading: const Icon(Icons.payment, color: Colors.blueAccent),
//               title: const Text('Payment Methods'),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 // TODO: Navigate to payment methods screen
//               },
//             ),
//             Divider(height: 1, color: Colors.grey[300]),
//             ListTile(
//               leading: const Icon(Icons.account_box_outlined, color: Colors.blueAccent),
//               title: const Text('Manage Account'),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 // TODO: Navigate to payment methods screen
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
//                 // TODO: Navigate to help center screen
//               },
//             ),
//             Divider(height: 1, color: Colors.grey[300]),
//             ListTile(
//               leading: const Icon(Icons.info_outline, color: Colors.blueAccent),
//               title: const Text('About Us'),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 // TODO: Navigate to about us screen
//               },
//             ),

//             SizedBox(height: 10),

//             // Logout Button
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   // TODO: Implement logout functionality
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red,
//                   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
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
//         style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
//       ),
//     );
//   }
// }
