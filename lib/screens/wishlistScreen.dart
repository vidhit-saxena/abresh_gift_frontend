import 'package:flutter/material.dart';
import 'package:abresh_gift_frontend/screens/productDetailScreen.dart';

class WishlistScreen extends StatelessWidget {
  final List<Map<String, dynamic>> wishlistItems = [
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'Product 1',
      'price': 50.00,
    },
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'Product 2',
      'price': 70.00,
    },
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'Product 3',
      'price': 100.00,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: wishlistItems.isEmpty
          ? Center(child: Text('No items in your wishlist'))
          : ListView.builder(
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                return WishlistTile(
                  imageUrl: wishlistItems[index]['image'],
                  name: wishlistItems[index]['name'],
                  price: wishlistItems[index]['price'],
                );
              },
            ),
    );
  }
}

class WishlistTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;

  WishlistTile({required this.imageUrl, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            ListTile(
              leading: Image.network(imageUrl, fit: BoxFit.cover, width: 80),
              title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('\Rs ${price.toStringAsFixed(2)}', style: TextStyle(color: Colors.green)),
              onTap: () {
                // Navigate to the product detail screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(),
                  ),
                );
              },
            ),
            // Row of buttons for "Delete" and "Add to Cart"
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Delete Button
                  TextButton(
                    onPressed: () {
                      // TODO: Add functionality to remove the item from the wishlist
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: Colors.red),
                        SizedBox(width: 5),
                        Text('Delete', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  // Add to Cart Button
                  TextButton(
                    onPressed: () {
                      // TODO: Add functionality to add the item to the cart
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.add_shopping_cart, color: Colors.blue),
                        SizedBox(width: 5),
                        Text('Add to Cart', style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:giftapp/screens/productDetailScreen.dart';

// class WishlistScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> wishlistItems = [
//     {
//       'image': 'https://via.placeholder.com/150',
//       'name': 'Product 1',
//       'price': 50.00,
//     },
//     {
//       'image': 'https://via.placeholder.com/150',
//       'name': 'Product 2',
//       'price': 70.00,
//     },
//     {
//       'image': 'https://via.placeholder.com/150',
//       'name': 'Product 3',
//       'price': 100.00,
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Wishlist'),
//       ),
//       body: wishlistItems.isEmpty
//           ? Center(child: Text('No items in your wishlist'))
//           : ListView.builder(
//               itemCount: wishlistItems.length,
//               itemBuilder: (context, index) {
//                 return WishlistTile(
//                   imageUrl: wishlistItems[index]['image'],
//                   name: wishlistItems[index]['name'],
//                   price: wishlistItems[index]['price'],
//                 );
//               },
//             ),
//     );
//   }
// }

// class WishlistTile extends StatelessWidget {
//   final String imageUrl;
//   final String name;
//   final double price;

//   WishlistTile({required this.imageUrl, required this.name, required this.price});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         elevation: 5,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         child: ListTile(
//           leading: Image.network(imageUrl, fit: BoxFit.cover, width: 80),
//           title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
//           subtitle: Text('\Rs ${price.toStringAsFixed(2)}', style: TextStyle(color: Colors.green)),
//           trailing: IconButton(
//             icon: Icon(Icons.delete_outline),
//             onPressed: () {
//               // TODO: Add functionality to remove the item from the wishlist
//             },
//           ),
//           onTap: () {
//             // TODO: Add functionality to navigate to the product detail screen
//             Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             ProductDetailScreen(), 
//                       ),
//                     );
//           },
//         ),
//       ),
//     );
//   }
// }
