import 'package:flutter/material.dart';
import 'package:play_book_ui/ui/components/utils.dart';
import 'package:play_book_ui/ui/components/wishlist.dart';

import '../home/home_screen.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (con, index) => Wishlist(book: books[index]),
          separatorBuilder: (con, index) => generalSpaceHeight(),
          itemCount: books.length),
    );
  }
}
