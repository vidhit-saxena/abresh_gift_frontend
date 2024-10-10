import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help & Support"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildHelpCategory(
            context,
            title: "FAQs",
            icon: Icons.help_outline,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FAQScreen(),
                ),
              );
            },
          ),
          _buildHelpCategory(
            context,
            title: "Order Related Issues",
            icon: Icons.shopping_cart_outlined,
            onTap: () {
              // Navigate to Order Issues screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderIssuesScreen(),
                ),
              );
            },
          ),
          _buildHelpCategory(
            context,
            title: "Payments",
            icon: Icons.payment_outlined,
            onTap: () {
              // Navigate to Payment Issues screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentIssuesScreen(),
                ),
              );
            },
          ),
          _buildHelpCategory(
            context,
            title: "Returns & Refunds",
            icon: Icons.keyboard_return_outlined,
            onTap: () {
              // Navigate to Returns & Refunds screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReturnsRefundsScreen(),
                ),
              );
            },
          ),
          _buildHelpCategory(
            context,
            title: "Contact Us",
            icon: Icons.phone_in_talk_outlined,
            onTap: () {
              // Navigate to Contact Us screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactUsScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHelpCategory(BuildContext context,
      {required String title,
      required IconData icon,
      required Function() onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}

class FAQScreen extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      "question": "How do I track my order?",
      "answer":
          "You can track your order from the Orders section in your account."
    },
    {
      "question": "What is the return policy?",
      "answer": "You can return items within 30 days of delivery."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQs"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(faqs[index]["question"]!),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(faqs[index]["answer"]!),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ContactUsScreen extends StatelessWidget {
  final String phone = "1234567890";
  final String email = "support@abresh.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.phone, color: Colors.blueAccent),
              title: Text("Call Us"),
              subtitle: Text(phone),
              onTap: () {
                launch("tel:$phone");
              },
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.blueAccent),
              title: Text("Email Us"),
              subtitle: Text(email),
              onTap: () {
                launch("mailto:$email");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OrderIssuesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Related Issues"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildIssueCategory(
            context,
            title: "Where is my order?",
            description:
                "Track the status of your order in the Orders section.",
          ),
          _buildIssueCategory(
            context,
            title: "Order Delayed",
            description: "If your order is delayed, you can contact support.",
          ),
          _buildIssueCategory(
            context,
            title: "Order Canceled",
            description: "Find out why your order was canceled.",
          ),
        ],
      ),
    );
  }

  Widget _buildIssueCategory(BuildContext context,
      {required String title, required String description}) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // You can add further details or navigation
      },
    );
  }
}

class PaymentIssuesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payments"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildIssueCategory(
            context,
            title: "Payment Failed",
            description: "Retry your payment or contact support.",
          ),
          _buildIssueCategory(
            context,
            title: "Refund Not Received",
            description: "Check the status of your refund.",
          ),
          _buildIssueCategory(
            context,
            title: "Payment Methods",
            description: "View available payment options.",
          ),
        ],
      ),
    );
  }

  Widget _buildIssueCategory(BuildContext context,
      {required String title, required String description}) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // You can add further details or navigation
      },
    );
  }
}

class ReturnsRefundsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Returns & Refunds"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildIssueCategory(
            context,
            title: "How to Return an Item?",
            description: "Learn the steps to return a product.",
          ),
          _buildIssueCategory(
            context,
            title: "Refund Process",
            description: "Understand how refunds are processed.",
          ),
          _buildIssueCategory(
            context,
            title: "Return Eligibility",
            description: "Check if your product is eligible for a return.",
          ),
        ],
      ),
    );
  }

  Widget _buildIssueCategory(BuildContext context,
      {required String title, required String description}) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // You can add further details or navigation
      },
    );
  }
}
