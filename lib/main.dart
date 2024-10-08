import 'package:abresh_gift_frontend/screens/accountScreen.dart';
import 'package:abresh_gift_frontend/screens/categoriesScreen.dart';
import 'package:abresh_gift_frontend/screens/helpScreen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Correct carousel package
import 'package:abresh_gift_frontend/screens/cartScreen.dart';
import 'package:abresh_gift_frontend/screens/notificationScreen.dart';
import 'package:abresh_gift_frontend/screens/productDetailScreen.dart';
import 'package:abresh_gift_frontend/screens/wishlistScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      // home: ProductDetailScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

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
      appBar: _selectedIndex ==0 ? AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Brand Logo',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border, color: Colors.grey),
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
                  icon: Icon(Icons.notifications_none, color: Colors.grey),
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
                  icon: Icon(Icons.shopping_cart, color: Colors.grey),
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
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Search Product',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ): null,
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
        items: [
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
    final List<String> bannerImages = [
      'https://via.placeholder.com/600x200', // Sample placeholder images
      'https://via.placeholder.com/600x200',
      'https://via.placeholder.com/600x200',
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
                  CategoryTile('Men', Icons.male),
                  CategoryTile('Women', Icons.female),
                  CategoryTile('Child', Icons.child_care),
                  CategoryTile('Home', Icons.home),
                  CategoryTile('Appliance', Icons.kitchen),
                  CategoryTile('Electronics', Icons.electrical_services),
                  CategoryTile('All', Icons.all_inclusive),
                ],
              ),
            ),
          ),
          // Featured Banner Carousel
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                autoPlayInterval: Duration(seconds: 2),
              ),
              items: bannerImages.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
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
  final IconData icon;

  CategoryTile(this.category, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue[100],
            child: Icon(icon, color: Colors.blue),
          ),
          SizedBox(height: 8),
          Text(
            category,
            style: TextStyle(fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis, // Prevent overflow of text
          ),
        ],
      ),
    );
  }
}

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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
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
          width: 160,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
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
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage('https://via.placeholder.com/160'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Title',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '\$ 99.99',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// class HomeScreen extends StatelessWidget {
//   // List of banners to be displayed in the carousel
//   final List<String> bannerImages = [
//     'https://via.placeholder.com/600x200', // Sample placeholder images
//     'https://via.placeholder.com/600x200',
//     'https://via.placeholder.com/600x200',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Brand Logo',
//               style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//             ), // Placeholder for logo
//             Row(
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.favorite_border, color: Colors.grey),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             WishlistScreen(), // Navigate to WishlistScreen
//                       ),
//                     );
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.notifications_none, color: Colors.grey),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => NotificationScreen(),
//                       ),
//                     );
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.shopping_cart, color: Colors.grey),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => CartScreen(),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(60),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: TextField(
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.grey[200],
//                 hintText: 'Search Product',
//                 prefixIcon: Icon(Icons.search, color: Colors.grey),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Categories Scrollable
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 height: 120, // Increased height to prevent overflow
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     CategoryTile('Men', Icons.male),
//                     CategoryTile('Women', Icons.female),
//                     CategoryTile('Child', Icons.child_care),
//                     CategoryTile('Home', Icons.home),
//                     CategoryTile('Appliance', Icons.kitchen),
//                     CategoryTile('Electronics', Icons.electrical_services),
//                     CategoryTile('All', Icons.all_inclusive),
//                   ],
//                 ),
//               ),
//             ),
//             // Featured Banner Carousel
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
//               child: CarouselSlider(
//                 options: CarouselOptions(
//                   height: 200,
//                   autoPlay: true,
//                   enlargeCenterPage: true,
//                   autoPlayInterval: Duration(seconds: 2),
//                 ),
//                 items: bannerImages.map((imageUrl) {
//                   return Builder(
//                     builder: (BuildContext context) {
//                       return Container(
//                         width: MediaQuery.of(context).size.width,
//                         margin: EdgeInsets.symmetric(horizontal: 10.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black26,
//                               blurRadius: 10,
//                               offset: Offset(0, 5),
//                             ),
//                           ],
//                           image: DecorationImage(
//                             image: NetworkImage(imageUrl),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }).toList(),
//               ),
//             ),
//             // Scrollable Product Sections
//             ScrollableProductSection(title: 'New Arrivals'),
//             ScrollableProductSection(title: 'Best Sellers'),
//             ScrollableProductSection(title: 'Discounted Items'),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         showUnselectedLabels: true,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.category),
//             label: 'Categories',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.help_outline),
//             label: 'Help',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle),
//             label: 'Account',
//           ),
//         ],
//       ),
//     );
//   }
// }



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
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 10,
//                 offset: Offset(0, 5),
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: 120,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
//                 ),
//                 child: Center(child: Text('Product Image')),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'Product Name',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Text(
//                   '\Rs 99.99',
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BottomNavDemo extends StatefulWidget {
//   @override
//   _BottomNavDemoState createState() => _BottomNavDemoState();
// }

// class _BottomNavDemoState extends State<BottomNavDemo> {
//   int _selectedIndex = 0; // To keep track of selected tab

//   // List of widget screens
//   final List<Widget> _screens = [
//     HomeScreen(),
//     CategoriesScreen(),
//     HelpScreen(),
//     AccountScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index; // Update selected index
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_selectedIndex], // Display the selected screen
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         showUnselectedLabels: true,
//         currentIndex: _selectedIndex, // Set current index
//         onTap: _onItemTapped, // Handle tab change
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.category),
//             label: 'Categories',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.help_outline),
//             label: 'Help',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle),
//             label: 'Account',
//           ),
//         ],
//       ),
//     );
//   }
// }
