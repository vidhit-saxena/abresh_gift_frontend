import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  // Sample list of notifications
  final List<Map<String, String>> notifications = [
    {
      'title': 'New Product Launched!',
      'message': 'Check out our latest product in the store.',
      'date': '2024-10-07',
    },
    {
      'title': 'Sale Alert!',
      'message': 'Hurry up! Get a 20% discount on all items.',
      'date': '2024-10-05',
    },
    {
      'title': 'Limited Edition Products',
      'message': 'Don\'t miss out on our limited edition products.',
      'date': '2024-10-01',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.blueAccent,
      ),
      body: notifications.isEmpty
          ? Center(
              child: Text(
                'No notifications available',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return NotificationTile(
                  title: notifications[index]['title'] ?? 'No Title',
                  message: notifications[index]['message'] ?? 'No Message',
                  date: notifications[index]['date'] ?? 'No Date',
                );
              },
            ),
    );
  }
}

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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Text(
                message,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 5),
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
