import 'package:flutter/material.dart';
import 'package:play_book_ui/data/items/book_item.dart';
import 'package:play_book_ui/data/items/book_section_item.dart';

import 'book.dart';
import 'utils.dart';

class BookSection extends StatelessWidget {
  const BookSection(
      {super.key,
      required this.section,
      required this.onTapItem,
      required this.onTapSeeAll});

  final BookSectionItem section;
  final void Function(BookItem) onTapItem;
  final void Function(BookSectionItem) onTapSeeAll;

  // List<BookItem> get() => section.books;

  @override
  Widget build(BuildContext context) {
    var books = section.books;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              section.label,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            IconButton(
                onPressed: () => onTapSeeAll(section),
                icon: const Icon(Icons.arrow_forward))
          ],
        ),
        generalSpaceHeight(),
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 300, maxHeight: 350),
          child: ListView.separated(
              clipBehavior: Clip.none,
              primary: false,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (con, index) =>
                  Book(book: books[index], onTap: onTapItem),
              separatorBuilder: (con, index) => generalSpaceWidth(),
              itemCount: books.length),
        )
      ],
    );
  }
}
