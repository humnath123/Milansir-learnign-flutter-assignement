import 'package:flutter/material.dart';

import '../data/product_data.dart';
import '../widgets/product_card.dart';
import 'product_details_page.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;

  const CategoryPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final categoryProducts = products
        .where((product) => product.category == categoryName)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),

      body: categoryProducts.isEmpty
          ? const Center(child: Text('No products found'))
          : Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                itemCount: categoryProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.62,
                ),
                itemBuilder: (context, index) {
                  final product = categoryProducts[index];

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
    );
  }
}
