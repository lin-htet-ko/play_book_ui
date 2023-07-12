import 'package:flutter/material.dart';
import 'package:play_book_ui/data/items/category_item.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.category, required this.onTap});

  final CategoryItem category;
  final void Function(CategoryItem) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(category),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 40, height: 40, child: Image.asset(category.image)),
            const SizedBox(
              width: 10,
            ),
            Text(
              category.label,
              style: const TextStyle(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}
