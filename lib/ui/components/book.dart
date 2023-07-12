import 'package:flutter/material.dart';

import '../../data/items/book_item.dart';
import 'utils.dart';

class Book extends StatelessWidget {
  const Book({super.key, required this.book, required this.onTap});

  final BookItem book;
  final Function(BookItem) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(book),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 160, maxWidth: 160),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              clipBehavior: Clip.antiAlias,
              child: Image.network(book.image,
                  width: 160, height: 260, fit: BoxFit.cover),
            ),
            generalSpaceHeight(),
            Text(book.name, maxLines: 1, overflow: TextOverflow.ellipsis),
            smallSpaceHeight(),
            Text(book.edition),
            smallSpaceHeight(),
            Text("\$ ${book.price}")
          ],
        ),
      ),
    );
  }
}
