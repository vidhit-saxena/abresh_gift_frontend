import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Notification Service to handle API requests
class NotificationService {
  static const String baseUrl = 'http://192.168.1.5:5000/api'; // Update with your server URL

  // Fetch notifications from backend
  Future<List<Map<String, dynamic>>> fetchNotifications() async {
    final response = await http.get(Uri.parse('$baseUrl/notifications'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => item as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load notifications');
    }
  }
}

// Main Notification Screen
class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late Future<List<Map<String, dynamic>>> notifications;

  @override
  void initState() {
    super.initState();
    notifications = NotificationService().fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: notifications,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load notifications'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No notifications available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final notification = snapshot.data![index];
                return NotificationTile(
                  title: notification['title'] ?? 'No Title',
                  message: notification['message'] ?? 'No Message',
                  date: notification['date'] ?? 'No Date',
                );
              },
            );
          }
        },
      ),
    );
  }
}

// Notification Tile Widget to display each notification
class NotificationTile extends StatelessWidget {
  final String title;
  final String message;
  final String date;

  NotificationTile({required this.title, required this.message, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(
                message,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(height: 5),
              Text(
                date,
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class NotificationScreen extends StatelessWidget {
//   // Sample list of notifications
//   final List<Map<String, String>> notifications = [
    // {
    //   'title': 'New Product Launched!',
    //   'message': 'Check out our latest product in the store.',
    //   'date': '2024-10-07',
    // },
    // {
    //   'title': 'Sale Alert!',
    //   'message': 'Hurry up! Get a 20% discount on all items.',
    //   'date': '2024-10-05',
    // },
    // {
    //   'title': 'Limited Edition Products',
    //   'message': 'Don\'t miss out on our limited edition products.',
    //   'date': '2024-10-01',
    // },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Notifications', style: TextStyle(fontWeight: FontWeight.bold,),),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: notifications.isEmpty
//           ? const Center(
//               child: Text(
//                 'No notifications available',
//                 style: TextStyle(fontSize: 18, color: Colors.grey),
//               ),
//             )
//           : ListView.builder(
//               itemCount: notifications.length,
//               itemBuilder: (context, index) {
//                 return NotificationTile(
//                   title: notifications[index]['title'] ?? 'No Title',
//                   message: notifications[index]['message'] ?? 'No Message',
//                   date: notifications[index]['date'] ?? 'No Date',
//                 );
//               },
//             ),
//     );
//   }
// }

// class NotificationTile extends StatelessWidget {
//   final String title;
//   final String message;
//   final String date;

//   NotificationTile({required this.title, required this.message, required this.date});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         elevation: 3,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: ListTile(
//           title: Text(
//             title,
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//           ),
//           subtitle: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 5),
//               Text(
//                 message,
//                 style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 date,
//                 style: TextStyle(fontSize: 12, color: Colors.grey[500]),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
