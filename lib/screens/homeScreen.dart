import 'package:abresh_gift_frontend/screens/account/accountScreen.dart';
import 'package:abresh_gift_frontend/screens/cartScreen.dart';
import 'package:abresh_gift_frontend/screens/categoriesScreen.dart';
import 'package:abresh_gift_frontend/screens/helpScreen.dart';
import 'package:abresh_gift_frontend/screens/notificationScreen.dart';
import 'package:abresh_gift_frontend/screens/productDetailScreen.dart';
import 'package:abresh_gift_frontend/screens/wishlistScreen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Correct carousel package


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of screens for navigation
  final List<Widget> _screens = [
    HomeContent(),
    CategoriesScreen(),
    HelpScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index on tab click
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Brand Logo',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite_border,
                            color: Colors.grey),
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
                        icon: const Icon(Icons.notifications_none,
                            color: Colors.grey),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationScreen(),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon:
                            const Icon(Icons.shopping_cart, color: Colors.grey),
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
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Search Product',
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : null,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens, // Display selected screen
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex, // Set current index
        onTap: _onItemTapped, // Handle tap
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: 'Help',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List of banners to be displayed in the carousel
    // final List<String> bannerImages = [
    //   'https://via.placeholder.com/600x200', // Sample placeholder images
    //   'https://via.placeholder.com/600x200',
    //   'https://via.placeholder.com/600x200',
    // ];
    final List<String> bannerImages = [
      'assets/images/men_category.jpg',
      'assets/images/women_category.jpg',
      'assets/images/kids_category.jpg',
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Categories Scrollable
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 120, // Increased height to prevent overflow
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // CategoryTile('Men', Icons.male),
                  // CategoryTile('Women', Icons.female),
                  // CategoryTile('Kids', Icons.child_care),
                  // CategoryTile('Home', Icons.home),
                  CategoryTile('Men', 
                  // Icons.male, 
                  Image.asset('assets/images/men.png', height: 40, width: 40), // Replace with your image path
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubcategoryScreen(
                                categoryName: 'Men',
                                subcategories: menSubcategories,
                              )),
                    );
                  }),
                  const SizedBox(width: 20), // Add spacing between the tiles
                  CategoryTile('Women', 
                  // Icons.female, 
                  Image.asset('assets/images/woman.png', height: 40, width: 40),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubcategoryScreen(
                                categoryName: 'Women',
                                subcategories: womenSubcategories,
                              )),
                    );
                  }),
                  const SizedBox(width: 20),
                  CategoryTile('Kids', 
                  Image.asset('assets/images/kids.png', height: 40, width: 40),
                  // Icons.child_care, 
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubcategoryScreen(
                                categoryName: 'Kids',
                                subcategories: kidsSubcategories,
                              )),
                    );
                  }),
                  const SizedBox(width: 20),
                  CategoryTile('Home', 
                  Image.asset('assets/images/house.png', height: 50, width: 50),
                  // Icons.home, 
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubcategoryScreen(
                                categoryName: 'Home',
                                subcategories: homeSubcategories,
                              )),
                    );
                  }),
                  // You can add more categories similarly
                ],
              ),
            ),
          ),
          // Featured Banner Carousel
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
          //   child: CarouselSlider(
          //     options: CarouselOptions(
          //       height: 210,
          //       autoPlay: true,
          //       enlargeCenterPage: true,
          //       autoPlayInterval: const Duration(seconds: 2),
          //     ),
          //     items: bannerImages.map((imageUrl) {
          //       return Builder(
          //         builder: (BuildContext context) {
          //           return Container(
          //             // width: MediaQuery.of(context).size.width*0.9, // Adjust width here
          //             width: 620, // Adjust width here
          //             margin: const EdgeInsets.symmetric(horizontal: 10.0),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(15),
          //               boxShadow: [
          //                 const BoxShadow(
          //                   color: Colors.black26,
          //                   blurRadius: 10,
          //                   offset: Offset(0, 5),
          //                 ),
          //               ],
          //               image: DecorationImage(
          //                 image: AssetImage(imageUrl),
          //                 fit: BoxFit.cover,
          //               ),
          //             ),
          //           );
          //         },
          //       );
          //     }).toList(),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            child: SizedBox(
              width: 630, // Set the width of the entire carousel
              height: 210, // Set the height of the entire carousel
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 210, // Maintain the height as 210
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 2),
                ),
                items: bannerImages.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: 630, // Explicitly set each item's width to 610
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),

          // Scrollable Product Sections
          ScrollableProductSection(title: 'New Arrivals'),
          ScrollableProductSection(title: 'Best Sellers'),
          ScrollableProductSection(title: 'Discounted Items'),
        ],
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String category;
  // final IconData icon;
  final Widget image;
  final VoidCallback onTap;

  CategoryTile(this.category, this.image, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Handle tap event
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              // child: Icon(icon, color: Colors.blue),
              child: image,
            ),
            const SizedBox(height: 8),
            Text(
              category,
              style: const TextStyle(fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis, // Prevent overflow of text
            ),
          ],
        ),
      ),
    );
  }
}
// class CategoryTile extends StatelessWidget {
//   final String category;
//   final IconData icon;
//   final VoidCallback onTap;

//   CategoryTile(this.category, this.icon, {required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           CircleAvatar(
//             radius: 30,
//             backgroundColor: Colors.blue[100],
//             child: Icon(icon, color: Colors.blue),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             category,
//             style: const TextStyle(fontWeight: FontWeight.w500),
//             overflow: TextOverflow.ellipsis, // Prevent overflow of text
//           ),
//         ],
//       ),
//     );
//   }
// }

class ScrollableProductSection extends StatelessWidget {
  final String title;

  ScrollableProductSection({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ProductTile(),
                ProductTile(),
                ProductTile(),
                ProductTile(),
                ProductTile(),
                ProductTile(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to ProductDetailScreen when the tile is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetailScreen()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 160, // Set the width of the product tile
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product image with increased height
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 142, // Increased height
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/product.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Smaller discount badge
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            '20% OFF',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10, // Smaller font size
                            ),
                          ),
                        ),
                      ),
                      // Favorite icon
                      const Positioned(
                        top: 10,
                        right: 10,
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product title with ellipsis to prevent overflow
                    Text(
                      'Product Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    // Product price on a separate line
                    Text(
                      '\Rs 99.99',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 4),
                    // Star Rating on a separate line
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.orange),
                        Icon(Icons.star, size: 16, color: Colors.orange),
                        Icon(Icons.star, size: 16, color: Colors.orange),
                        Icon(Icons.star, size: 16, color: Colors.grey),
                        Icon(Icons.star, size: 16, color: Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}


// class ProductTile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Navigate to ProductDetailScreen when the tile is tapped
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => ProductDetailScreen()),
//         );
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           width: 160,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(15),
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 10,
//                 offset: Offset(0, 5),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     image: DecorationImage(
//                       // image: NetworkImage('https://via.placeholder.com/160'),
//                       image: AssetImage('assets/images/product.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Product Title',
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       '\Rs 99.99',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                           color: Colors.green),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
