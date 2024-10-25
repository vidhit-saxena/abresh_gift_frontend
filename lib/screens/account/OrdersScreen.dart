import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Product {
  final String id;
  final String name;
  final int quantity;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['productId']['_id'],
      name: json['productId']['name'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
    );
  }
}

class Order {
  final String id;
  final List<Product> products;
  final DateTime orderDate;
  final String status;

  Order({
    required this.id,
    required this.products,
    required this.orderDate,
    required this.status,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'],
      products: (json['products'] as List)
          .map((item) => Product.fromJson(item))
          .toList(),
      orderDate: DateTime.parse(json['orderDate']),
      status: json['status'],
    );
  }
}

class OrderScreen extends StatefulWidget {
  final String userId;

  OrderScreen({required this.userId});

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late Future<List<Order>> futureOrders;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    futureOrders = fetchUserOrders(widget.userId);
  }

  Future<List<Order>> fetchUserOrders(String userId) async {
    final String baseUrl = "http://192.168.1.6:5000/api"; // Your backend URL
    final response = await http.get(Uri.parse('$baseUrl/orders/$userId'));

    if (response.statusCode == 200) {
      List<dynamic> jsonOrders = json.decode(response.body);
      return jsonOrders.map((json) => Order.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: FutureBuilder<List<Order>>(
        future: futureOrders,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No orders found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final order = snapshot.data![index];
                return Card(
                  child: ListTile(
                    title: Text('Order ${order.id}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...order.products.map((product) => Text(
                              '${product.name} - ${product.quantity} x \$${product.price}',
                            )),
                        Text('Order Date: ${order.orderDate.toLocal()}'),
                        Text('Status: ${order.status}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}



// Dummy Screens for Orders, Address, Payment, Account, Help and About Us
// class OrdersScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('My Orders')),
//       body: const Center(child: Text('Orders list goes here')),
//     );
//   }
// }