import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Delivery Address Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery Address',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John Doe',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('123, Main Street'),
                          Text('City, State, 123456'),
                          Text('Phone: +91 9876543210'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      // Navigate to change address screen
                    },
                    child: Text(
                      'Change or Add Address',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),

            Divider(thickness: 1),

            // Order Summary Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Summary',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image.network(
                            'https://via.placeholder.com/100',
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                          title: Text('Product Name'),
                          subtitle: Text('1 Item'),
                          trailing: Text('\Rs 499'),
                        ),
                        ListTile(
                          leading: Image.network(
                            'https://via.placeholder.com/100',
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                          title: Text('Product Name 2'),
                          subtitle: Text('2 Items'),
                          trailing: Text('\Rs 899'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Divider(thickness: 1),

            // Payment Method Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Method',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.credit_card),
                          title: Text('Credit/Debit Card'),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Navigate to payment options screen
                          },
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.account_balance_wallet),
                          title: Text('Wallets'),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Navigate to wallets screen
                          },
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.money),
                          title: Text('Cash on Delivery'),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Select Cash on Delivery
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Divider(thickness: 1),

            // Price Details Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          _buildPriceDetailRow('Subtotal', '\Rs 1398'),
                          _buildPriceDetailRow('Delivery', '\Rs 50'),
                          _buildPriceDetailRow('Discount', '-\Rs 100'),
                          Divider(),
                          _buildPriceDetailRow(
                            'Total',
                            '\Rs 1348',
                            isBold: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Bar with Place Order Button
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {
            // Trigger place order functionality
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15),
            backgroundColor: Colors.blue,
          ),
          child: Text(
            'Place Order',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }

  // Helper function to create price detail rows
  Widget _buildPriceDetailRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
