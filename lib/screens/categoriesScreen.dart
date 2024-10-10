import 'package:flutter/material.dart';

// Class representing a Category
class Category {
  final String name;
  final String imageUrl;
  final List<Subcategory> subcategories;

  Category({required this.name, required this.imageUrl, required this.subcategories});
}

// Class representing a Subcategory
class Subcategory {
  final String name;
  final String imageUrl;

  Subcategory({required this.name, required this.imageUrl});
}

// Sample subcategories data for each category
List<Subcategory> menSubcategories = [
  Subcategory(name: 'Footwear', imageUrl: 'https://via.placeholder.com/150x200.png?text=Men%27s+Footwear'),
  Subcategory(name: 'Clothing', imageUrl: 'https://via.placeholder.com/150x200.png?text=Men%27s+Clothing'),
  Subcategory(name: 'Watches', imageUrl: 'https://via.placeholder.com/150x200.png?text=Men%27s+Watches'),
  Subcategory(name: 'Accessories', imageUrl: 'https://via.placeholder.com/150x200.png?text=Men%27s+Accessories'),
];

List<Subcategory> womenSubcategories = [
  Subcategory(name: 'Footwear', imageUrl: 'https://via.placeholder.com/150x200.png?text=Women%27s+Footwear'),
  Subcategory(name: 'Clothing', imageUrl: 'https://via.placeholder.com/150x200.png?text=Women%27s+Clothing'),
  Subcategory(name: 'Watches', imageUrl: 'https://via.placeholder.com/150x200.png?text=Women%27s+Watches'),
  Subcategory(name: 'Accessories', imageUrl: 'https://via.placeholder.com/150x200.png?text=Women%27s+Accessories'),
  Subcategory(name: 'Bags', imageUrl: 'https://via.placeholder.com/150x200.png?text=Women%27s+Bags'),
];

List<Subcategory> kidsSubcategories = [
  Subcategory(name: 'Footwear', imageUrl: 'https://via.placeholder.com/150x200.png?text=Kids%27+Footwear'),
  Subcategory(name: 'Clothing', imageUrl: 'https://via.placeholder.com/150x200.png?text=Kids%27+Clothing'),
  Subcategory(name: 'Toys', imageUrl: 'https://via.placeholder.com/150x200.png?text=Kids%27+Toys'),
];

List<Category> categories = [
  Category(name: 'Men', imageUrl: 'https://via.placeholder.com/150x200.png?text=Men', subcategories: menSubcategories),
  Category(name: 'Women', imageUrl: 'https://via.placeholder.com/150x200.png?text=Women', subcategories: womenSubcategories),
  Category(name: 'Kids', imageUrl: 'https://via.placeholder.com/150x200.png?text=Kids', subcategories: kidsSubcategories),
  // Category(name: 'Home', imageUrl: 'https://via.placeholder.com/150x200.png?text=Home', subcategories: kidsSubcategories),
];

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        backgroundColor: Colors.blueAccent, // Customize the app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of categories per row
            crossAxisSpacing: 10, // Space between grid items horizontally
            mainAxisSpacing: 10, // Space between grid items vertically
            childAspectRatio: 0.7, // Adjusted aspect ratio for a more appealing look
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to subcategory screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubcategoryScreen(
                      subcategories: categories[index].subcategories,
                      categoryName: categories[index].name,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          categories[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        categories[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SubcategoryScreen extends StatelessWidget {
  final List<Subcategory> subcategories;
  final String categoryName;

  SubcategoryScreen({required this.subcategories, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryName'),
        backgroundColor: Colors.blueAccent, // Customize the app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: subcategories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of subcategories per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to the product list screen for the selected subcategory
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductListScreen(
                      subcategory: subcategories[index],
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          subcategories[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        subcategories[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final Subcategory subcategory;

  ProductListScreen({required this.subcategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subcategory.name),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text('Display products for ${subcategory.name} here'),
      ),
    );
  }
}








// import 'package:flutter/material.dart';

// class Category {
//   final String name;
//   final String imageUrl;

//   Category({required this.name, required this.imageUrl});
// }

// // Sample categories data with dummy images
// List<Category> categories = [
//   Category(name: 'Men', imageUrl: 'https://via.placeholder.com/150x200.png?text=Men'),
//   Category(name: 'Women', imageUrl: 'https://via.placeholder.com/150x200.png?text=Women'),
//   Category(name: 'Kids', imageUrl: 'https://via.placeholder.com/150x200.png?text=Kids'),
//   Category(name: 'Footwear', imageUrl: 'https://via.placeholder.com/150x200.png?text=Footwear'),
//   Category(name: 'Accessories', imageUrl: 'https://via.placeholder.com/150x200.png?text=Accessories'),
//   Category(name: 'Sale', imageUrl: 'https://via.placeholder.com/150x200.png?text=Sale'),
// ];

// class CategoriesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Categories'),
//         backgroundColor: Colors.blue, // Customize the app bar color
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.builder(
//           itemCount: categories.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, // Number of categories per row
//             crossAxisSpacing: 10, // Space between grid items horizontally
//             mainAxisSpacing: 10, // Space between grid items vertically
//             childAspectRatio: 3 / 4, // Aspect ratio for each grid item
//           ),
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () {
//                 // Navigate to category-specific screen
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => CategoryDetailScreen(
//                       category: categories[index],
//                     ),
//                   ),
//                 );
//               },
//               child: Card(
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: Image.network(
//                         categories[index].imageUrl,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         categories[index].name,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class CategoryDetailScreen extends StatelessWidget {
//   final Category category;

//   CategoryDetailScreen({required this.category});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(category.name),
//       ),
//       body: Center(
//         child: Text('Display products of ${category.name} here'),
//       ),
//     );
//   }
// }
