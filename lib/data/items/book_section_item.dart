import 'package:play_book_ui/data/items/book_item.dart';

class BookSectionItem {
  static int index = 0;

  BookSectionItem({required this.label, required this.books});

  final int id = index++;
  final String label;
  final List<BookItem> books;
}
