import 'package:flutter/material.dart';
import 'package:abresh_gift_frontend/screens/cartScreen.dart';
// import 'package:giftapp/screens/wishlistScreen.dart';

class ProductDetailScreen extends StatelessWidget {
  final List<String> productImages = [
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400?image=2',
    'https://via.placeholder.com/600x400?image=3',
    'https://via.placeholder.com/600x400?image=4',
    'https://via.placeholder.com/600x400?image=5'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image Carousel
            Container(
              height: 300,
              child: PageView.builder(
                itemCount: productImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(
                      productImages[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                },
              ),
            ),

            // Product Title & Price
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Name',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\$99.99',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  RatingStars(),
                ],
              ),
            ),

            // Product Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'This is the product description. It contains details about the product, including features and specifications. It helps the customer to get a better understanding of the product before making a purchase.',
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
            ),

            // Product Size
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Text(
                    'Select Size:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 10),
                  DropdownButton<String>(
                    items: <String>['S', 'M', 'L', 'XL'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                    hint: Text('M'),
                  ),
                ],
              ),
            ),

            // Add to Cart & Buy Now buttons
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.orange,
                      ),
                      child: Text(
                        'Buy Now',
                        style: TextStyle(fontSize: 16),
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

// Widget for Rating Stars (Optional)
class RatingStars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.yellow[700], size: 20),
        Icon(Icons.star, color: Colors.yellow[700], size: 20),
        Icon(Icons.star, color: Colors.yellow[700], size: 20),
        Icon(Icons.star, color: Colors.yellow[700], size: 20),
        Icon(Icons.star_border, size: 20),
        SizedBox(width: 5),
        Text(
          '4.0',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}








// import 'package:flutter/material.dart';

// class ProductDetailScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Details'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.favorite_border),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product Image Carousel
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Image.network(
//                 'https://via.placeholder.com/600x400',
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//               ),
//             ),

//             // Product Title & Price
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Product Name',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     '\$99.99',
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.green,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   RatingStars(),
//                 ],
//               ),
//             ),

//             // Product Description
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'This is the product description. It contains details about the product, including features and specifications. It helps the customer to get a better understanding of the product before making a purchase.',
//                 style: TextStyle(fontSize: 16, color: Colors.grey[800]),
//               ),
//             ),

//             // Product Size
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//               child: Row(
//                 children: [
//                   Text(
//                     'Select Size:',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                   ),
//                   SizedBox(width: 10),
//                   DropdownButton<String>(
//                     items: <String>['S', 'M', 'L', 'XL'].map((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     onChanged: (_) {},
//                     hint: Text('M'),
//                   ),
//                 ],
//               ),
//             ),

//             // Add to Cart & Buy Now buttons
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(vertical: 15), backgroundColor: Colors.blue,
//                       ),
//                       child: Text(
//                         'Add to Cart',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(vertical: 15), backgroundColor: Colors.orange,
//                       ),
//                       child: Text(
//                         'Buy Now',
//                         style: TextStyle(fontSize: 16),
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

// // Widget for Rating Stars (Optional)
// class RatingStars extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(Icons.star, color: Colors.yellow[700], size: 20),
//         Icon(Icons.star, color: Colors.yellow[700], size: 20),
//         Icon(Icons.star, color: Colors.yellow[700], size: 20),
//         Icon(Icons.star, color: Colors.yellow[700], size: 20),
//         Icon(Icons.star_border, size: 20),
//         SizedBox(width: 5),
//         Text(
//           '4.0',
//           style: TextStyle(fontSize: 16),
//         ),
//       ],
//     );
//   }
// }
