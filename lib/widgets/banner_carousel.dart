import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  final List<Map<String, String>> banners = const [
    {
      'title': 'Summer Sale',
      'subtitle': 'Up to 50% Off',
      'image':
          'https://images.unsplash.com/photo-1607083206968-13611e3d76db?w=1200',
    },
    {
      'title': 'New Arrivals',
      'subtitle': 'Discover New Products',
      'image':
          'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=1200',
    },
    {
      'title': 'Electronics Discount',
      'subtitle': 'Best Deals Today',
      'image':
          'https://images.unsplash.com/photo-1550009158-9ebf69173e03?w=1200',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 190,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.92,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items: banners.map((banner) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                banner['image']!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.image_not_supported, size: 50),
                  );
                },
              ),

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.black.withOpacity(0.75),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),

              Positioned(
                left: 20,
                top: 45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      banner['title']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      banner['subtitle']!,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
