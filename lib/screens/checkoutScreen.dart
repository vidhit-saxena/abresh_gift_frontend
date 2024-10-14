import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
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
                  const Text(
                    'Delivery Address',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
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
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      // Navigate to change address screen
                    },
                    child: const Text(
                      'Change or Add Address',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(thickness: 1),

            // Order Summary Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order Summary',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
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
                          title: const Text('Product Name'),
                          subtitle: const Text('1 Item'),
                          trailing: const Text('\Rs 499'),
                        ),
                        ListTile(
                          leading: Image.network(
                            'https://via.placeholder.com/100',
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                          title: const Text('Product Name 2'),
                          subtitle: const Text('2 Items'),
                          trailing: const Text('\Rs 899'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Divider(thickness: 1),

            // Payment Method Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Payment Method',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.credit_card),
                          title: const Text('Credit/Debit Card'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Navigate to payment options screen
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.account_balance_wallet),
                          title: const Text('Wallets'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Navigate to wallets screen
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.money),
                          title: const Text('Cash on Delivery'),
                          trailing: const Icon(Icons.arrow_forward_ios),
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

            const Divider(thickness: 1),

            // Price Details Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Price Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
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
                          const Divider(),
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
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {
            // Trigger place order functionality
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15),
            backgroundColor: Colors.blue,
          ),
          child: const Text(
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
