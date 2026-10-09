import 'package:flutter/material.dart';

import '../data/product_data.dart';
import 'category_page.dart';
import 'product_details_page.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/category_item.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  IconData getCategoryIcon(String category) {
    switch (category) {
      case 'Electronics':
        return Icons.devices;

      case 'Fashion':
        return Icons.checkroom;

      case 'Shoes':
        return Icons.directions_run;

      case 'Beauty':
        return Icons.face;

      case 'Accessories':
        return Icons.watch;

      case 'Home':
        return Icons.home;

      default:
        return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.shopping_bag, size: 32, color: Colors.red),
            const SizedBox(width: 8),
            const Text(
              'MyShop',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Search feature coming soon')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Your cart is currently empty')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BannerCarousel(),

              const SizedBox(height: 25),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 15),

              // =========================
              // HORIZONTAL CATEGORIES
              // =========================
              SizedBox(
                height: 105,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    return CategoryItem(
                      category: category,
                      icon: getCategoryIcon(category),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CategoryPage(categoryName: category),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),

              // =========================
              // POPULAR PRODUCTS TITLE
              // =========================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular Products',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const CategoryPage(categoryName: 'Electronics'),
                          ),
                        );
                      },
                      child: const Text(
                        'See All →',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // =========================
              // PRODUCT GRID
              // =========================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.62,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return ProductCard(
                      product: product,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailsPage(product: product),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
