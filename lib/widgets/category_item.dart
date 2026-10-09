import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String category;
  final IconData icon;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.category,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: Colors.red,
                size: 28,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              category,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
