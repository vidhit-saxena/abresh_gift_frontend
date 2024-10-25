// // import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// // import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:abresh_gift_frontend/screens/wishlistScreen.dart';
import 'package:abresh_gift_frontend/screens/cartScreen.dart';
import 'dart:convert'; // for jsonEncode and jsonDecode
import 'package:http/http.dart' as http;
import 'package:abresh_gift_frontend/screens/isLoggedIn.dart'; // Import the IsLoggedIn class

class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _currentImageIndex = 0;
  String? selectedSize = 'M'; // Initialize to a default size
  final IsLoggedIn _loginManager =
      IsLoggedIn(); // Create an instance of the IsLoggedIn class

  final List<String> productImages = [
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400?image=2',
    'https://via.placeholder.com/600x400?image=3',
    'https://via.placeholder.com/600x400?image=4',
    'https://via.placeholder.com/600x400?image=5'
  ];

  final List<String> similarProductImages = [
    'https://via.placeholder.com/150x150?product=1',
    'https://via.placeholder.com/150x150?product=2',
    'https://via.placeholder.com/150x150?product=3',
    'https://via.placeholder.com/150x150?product=4',
  ];

  final List<String> otherProductImages = [
    'https://via.placeholder.com/150x150?other=1',
    'https://via.placeholder.com/150x150?other=2',
    'https://via.placeholder.com/150x150?other=3',
    'https://via.placeholder.com/150x150?other=4',
  ];

  final List<Map<String, dynamic>> reviews = [];
  String _reviewText = '';
  double _rating = 0.0;

  // New variable for storing the product data
  Map<String, dynamic>? productData;

  @override
  void initState() {
    super.initState();
    fetchProductDetails(); // Fetch product data when screen loads
  }

  // Function to fetch product details from the backend
  Future<void> fetchProductDetails() async {
    final response = await http.get(Uri.parse(
        'http://your-backend-url/api/product/123')); // Replace with your API URL

    if (response.statusCode == 200) {
      setState(() {
        productData = jsonDecode(response.body); // Parse the product data
      });
    } else {
      throw Exception('Failed to load product details');
    }
  }

  // Function to handle Add to Cart or Buy Now actions
  void _handleAction(BuildContext context, String action) async {
    bool isLoggedIn = await _loginManager.checkLoginStatus();
    if (isLoggedIn) {
      // If logged in, proceed with the action
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Item $action!")));
    } else {
      // If not logged in, show the login popup
      _loginManager.showLoginPopup(context, () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Logged in, item $action!")));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Detail',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WishlistScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
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
            // Image Slider
            Container(
              height: 300,
              child: PageView.builder(
                itemCount: productImages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentImageIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.network(
                    productImages[index],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: productImages.map((url) {
                int index = productImages.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentImageIndex == index
                        ? Colors.blueAccent
                        : Colors.grey,
                  ),
                );
              }).toList(),
            ),

            // Product Title, Price, and Rating
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Product Name - Stylish and Trendy',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '₹99.99',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Row(
                        children: [
                          RatingStars(),
                          const SizedBox(width: 5),
                          const Text(
                            '4.0',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Inclusive of all taxes',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            // Product Description Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Product Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This is a stylish and trendy product perfect for modern fashion. Features a sleek design and comfortable fit.',
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                ],
              ),
            ),

            // Select Size Dropdown
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Text(
                    'Select Size:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: selectedSize,
                    items: <String>['S', 'M', 'L', 'XL'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    // onChanged: (_) {},
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedSize =
                            newValue; // Update your selected value here
                      });
                    },
                    hint: const Text('Select Size'),
                  ),
                ],
              ),
            ),

            // Add to Cart and Buy Now buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add to cart logic
                         _handleAction(context, "added to cart"); // Add to Cart button
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add to cart logic
                        _handleAction(context, "bought"); // Buy Now button
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Customer Reviews Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Customer Reviews',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _reviewText = value;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Write your review',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  DropdownButton<double>(
                    value: _rating == 0.0
                        ? null
                        : _rating, // Use null when no rating is selected
                    items: [1.0, 2.0, 3.0, 4.0, 5.0]
                        .map((e) => DropdownMenuItem(
                              child: Text(e.toString()),
                              value: e,
                            ))
                        .toList(),
                    hint: const Text('Rating'),
                    onChanged: (value) {
                      setState(() {
                        _rating = value ?? 0.0;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_reviewText.isNotEmpty && _rating > 0) {
                    setState(() {
                      reviews.add({
                        'text': _reviewText,
                        'rating': _rating,
                      });
                      _reviewText = '';
                      _rating = 0.0;
                    });
                  }
                },
                child: const Text('Submit Review',
                    style: TextStyle(
                      fontSize: 18,
                    )),
              ),
            ),

            // Display Reviews
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: reviews.map((review) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RatingStars(rating: review['rating']),
                          const SizedBox(height: 5),
                          Text(
                            review['text'],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            // Similar Products Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Similar Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: similarProductImages.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            similarProductImages[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text('Similar Product $index'),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to product detail screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        backgroundColor: Colors.orangeAccent,
                      ),
                      child: const Text('View', style: TextStyle(fontSize: 14)),
                    ),
                  ],
                );
              },
            ),

            // Other Products Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Other Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: otherProductImages.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            otherProductImages[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text('Other Product $index'),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to product detail screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        backgroundColor: Colors.orangeAccent,
                      ),
                      child: const Text('View', style: TextStyle(fontSize: 14)),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RatingStars extends StatelessWidget {
  final double rating; // Add this line to define the rating parameter

  // Constructor to accept the rating
  RatingStars({this.rating = 0.0});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 18,
        );
      }),
    );
  }
}


// import 'dart:convert'; // For JSON decoding
// import 'package:flutter/material.dart';
// import 'package:abresh_gift_frontend/screens/wishlistScreen.dart';
// import 'package:abresh_gift_frontend/screens/cartScreen.dart';
// import 'package:http/http.dart' as http;

// class ProductDetailScreen extends StatefulWidget {
//   final String productId; // Accept productId as a parameter

//   ProductDetailScreen({required this.productId});

//   @override
//   _ProductDetailScreenState createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   int _currentImageIndex = 0;
//   String? selectedSize = 'M'; // Initialize to a default size
//   Map<String, dynamic>? productData; // Product data fetched from API
//   bool isLoading = true; // Show loading indicator while fetching data
//   String _reviewText = '';
//   double _rating = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     fetchProductDetails(); // Fetch product details when the screen loads
//   }

//   Future<void> fetchProductDetails() async {
//     // final String apiUrl = 'https://example.com/api/products/${widget.productId}';
//     final String apiUrl = 'https://example.com/api/products';

//     try {
//       final response = await http.get(Uri.parse(apiUrl));
//       if (response.statusCode == 200) {
//         setState(() {
//           productData = json.decode(response.body); // Decode the JSON response
//           isLoading = false; // Data is loaded
//         });
//       } else {
//         // Handle server error
//         print('Error: Failed to load product details');
//       }
//     } catch (error) {
//       // Handle any other error (e.g., network issues)
//       print('Error: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Product Detail',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.blueAccent,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.favorite_border),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => WishlistScreen(),
//                 ),
//               );
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.shopping_cart),
//             onPressed: () {
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
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator()) // Show loading indicator
//           : SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Image Slider
//                   Container(
//                     height: 300,
//                     child: PageView.builder(
//                       itemCount: productData?['images']?.length ?? 0,
//                       onPageChanged: (index) {
//                         setState(() {
//                           _currentImageIndex = index;
//                         });
//                       },
//                       itemBuilder: (context, index) {
//                         return Image.network(
//                           productData?['images'][index] ?? '',
//                           fit: BoxFit.cover,
//                           width: MediaQuery.of(context).size.width,
//                         );
//                       },
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: (productData?['images'] ?? []).map<Widget>((url) {
//                       int index = productData?['images'].indexOf(url) ?? 0;
//                       return Container(
//                         width: 8.0,
//                         height: 8.0,
//                         margin: const EdgeInsets.symmetric(
//                             vertical: 10.0, horizontal: 2.0),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: _currentImageIndex == index
//                               ? Colors.blueAccent
//                               : Colors.grey,
//                         ),
//                       );
//                     }).toList(),
//                   ),

//                   // Product Title, Price, and Rating
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           productData?['name'] ?? 'Product Name',
//                           style: const TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               '₹${productData?['price'] ?? '0.0'}',
//                               style: const TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.green,
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 RatingStars(
//                                   rating: double.parse(
//                                       productData?['rating']?.toString() ?? '0'),
//                                 ),
//                                 const SizedBox(width: 5),
//                                 Text(
//                                   productData?['rating']?.toString() ?? '0',
//                                   style: const TextStyle(fontSize: 16),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           'Inclusive of all taxes',
//                           style:
//                               TextStyle(fontSize: 14, color: Colors.grey[600]),
//                         ),
//                       ],
//                     ),
//                   ),

//                   // Product Description Section
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Product Description',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           productData?['description'] ??
//                               'No description available',
//                           style:
//                               TextStyle(fontSize: 16, color: Colors.grey[800]),
//                         ),
//                       ],
//                     ),
//                   ),

//                   // Add to Cart and Buy Now buttons
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: ElevatedButton(
//                             onPressed: () {
//                               // Add to wishlist logic
//                             },
//                             style: ElevatedButton.styleFrom(
//                               padding:
//                                   const EdgeInsets.symmetric(vertical: 15),
//                               backgroundColor: Colors.orange,
//                             ),
//                             child: const Text(
//                               'Add to Wishlist',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           child: ElevatedButton(
//                             onPressed: () {
//                               // Add to cart logic
//                             },
//                             style: ElevatedButton.styleFrom(
//                               padding:
//                                   const EdgeInsets.symmetric(vertical: 15),
//                               backgroundColor: Colors.blue,
//                             ),
//                             child: const Text(
//                               'Add to Cart',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   // Customer Reviews Section
//                   const Padding(
//                     padding: EdgeInsets.all(16.0),
//                     child: Text(
//                       'Customer Reviews',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: (productData?['reviews'] ?? [])
//                           .map<Widget>((review) {
//                         return Card(
//                           margin: const EdgeInsets.symmetric(vertical: 5),
//                           child: Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 RatingStars(
//                                   rating: double.parse(
//                                       review['rating'].toString() ?? '0'),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   review['text'] ?? 'No review text',
//                                   style: const TextStyle(fontSize: 16),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

// class RatingStars extends StatelessWidget {
//   final double rating; // Rating parameter

//   RatingStars({this.rating = 0.0});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: List.generate(5, (index) {
//         return Icon(
//           index < rating ? Icons.star : Icons.star_border,
//           color: Colors.amber,
//           size: 18,
//         );
//       }),
//     );
//   }
// }
