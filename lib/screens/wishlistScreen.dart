import 'package:flutter/material.dart';
import 'package:abresh_gift_frontend/screens/productDetailScreen.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  List<Map<String, dynamic>> wishlistItems = [
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

  List<Map<String, dynamic>> cartItems = [];

  // Function to remove item from wishlist
  void removeFromWishlist(int index) {
    setState(() {
      wishlistItems.removeAt(index);
    });
  }

  // Function to add item to the cart
  void addToCart(Map<String, dynamic> item) {
    setState(() {
      cartItems.add(item);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item['name']} added to the cart!'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wishlist',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: wishlistItems.isEmpty
          ? const Center(child: Text('No items in your wishlist'))
          : ListView.builder(
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                return WishlistTile(
                  imageUrl: wishlistItems[index]['image'],
                  name: wishlistItems[index]['name'],
                  price: wishlistItems[index]['price'],
                  onRemove: () => removeFromWishlist(index),
                  onAddToCart: () => addToCart(wishlistItems[index]),
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
  final VoidCallback onRemove;
  final VoidCallback onAddToCart;

  WishlistTile({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.onRemove,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadowColor: Colors.black26,
        child: Column(
          children: [
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                ),
              ),
              title: Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '\Rs ${price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(),
                  ),
                );
              },
            ),
            const Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Delete Button
                  ElevatedButton.icon(
                    onPressed: onRemove,
                    icon: const Icon(Icons.delete, color: Colors.red),
                    label: const Text('Delete', style: TextStyle(color: Colors.red)),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.red.withOpacity(0.1),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  // Add to Cart Button
                  ElevatedButton.icon(
                    onPressed: onAddToCart,
                    icon: const Icon(Icons.add_shopping_cart, color: Colors.blue),
                    label: const Text('Add to Cart', style: TextStyle(color: Colors.blue)),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.blue.withOpacity(0.1),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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
// import 'package:abresh_gift_frontend/screens/productDetailScreen.dart';

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
//         title: const Text(
//           'Wishlist',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: wishlistItems.isEmpty
//           ? const Center(child: Text('No items in your wishlist'))
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

//   WishlistTile(
//       {required this.imageUrl, required this.name, required this.price});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
//       child: Card(
//         elevation: 8,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         shadowColor: Colors.black26,
//         child: Column(
//           children: [
//             ListTile(
//               leading: ClipRRect(
//                 borderRadius: BorderRadius.circular(8.0),
//                 child: Image.network(
//                   imageUrl,
//                   fit: BoxFit.cover,
//                   width: 80,
//                   height: 80,
//                 ),
//               ),
//               title: Text(
//                 name,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//               subtitle: Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Text(
//                   '\Rs ${price.toStringAsFixed(2)}',
//                   style: const TextStyle(
//                     color: Colors.green,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ProductDetailScreen(),
//                   ),
//                 );
//               },
//             ),
//             const Divider(thickness: 1),
//             // Row of buttons for "Delete" and "Add to Cart"
//             Padding(
//               padding:
//                   const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Delete Button
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       // TODO: Add functionality to remove the item from the wishlist
//                     },
//                     icon: const Icon(Icons.delete, color: Colors.red),
//                     label: const Text('Delete',
//                         style: TextStyle(color: Colors.red)),
//                     style: ElevatedButton.styleFrom(
//                       elevation: 0,
//                       backgroundColor: Colors.red.withOpacity(0.1),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 10),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   // Add to Cart Button
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       // TODO: Add functionality to add the item to the cart
//                     },
//                     icon:
//                         const Icon(Icons.add_shopping_cart, color: Colors.blue),
//                     label: const Text('Add to Cart',
//                         style: TextStyle(color: Colors.blue)),
//                     style: ElevatedButton.styleFrom(
//                       elevation: 0,
//                       backgroundColor: Colors.blue.withOpacity(0.1),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 10),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:abresh_gift_frontend/screens/productDetailScreen.dart';

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
//         title: const Text('Wishlist', style: TextStyle(fontWeight: FontWeight.bold,),),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: wishlistItems.isEmpty
//           ? const Center(child: Text('No items in your wishlist'))
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
//         child: Column(
//           children: [
//             ListTile(
//               leading: Image.network(imageUrl, fit: BoxFit.cover, width: 80),
//               title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
//               subtitle: Text('\Rs ${price.toStringAsFixed(2)}', style: const TextStyle(color: Colors.green)),
//               onTap: () {
//                 // Navigate to the product detail screen
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ProductDetailScreen(),
//                   ),
//                 );
//               },
//             ),
//             // Row of buttons for "Delete" and "Add to Cart"
//             Padding(
//               padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Delete Button
//                   TextButton(
//                     onPressed: () {
//                       // TODO: Add functionality to remove the item from the wishlist
//                     },
//                     style: TextButton.styleFrom(
//                       backgroundColor: Colors.red.withOpacity(0.1),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: const Row(
//                       children: [
//                         Icon(Icons.delete, color: Colors.red),
//                         SizedBox(width: 5),
//                         Text('Delete', style: TextStyle(color: Colors.red)),
//                       ],
//                     ),
//                   ),
//                   // Add to Cart Button
//                   TextButton(
//                     onPressed: () {
//                       // TODO: Add functionality to add the item to the cart
//                     },
//                     style: TextButton.styleFrom(
//                       backgroundColor: Colors.blue.withOpacity(0.1),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: const Row(
//                       children: [
//                         Icon(Icons.add_shopping_cart, color: Colors.blue),
//                         SizedBox(width: 5),
//                         Text('Add to Cart', style: TextStyle(color: Colors.blue)),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

