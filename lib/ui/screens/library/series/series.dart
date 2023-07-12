import 'package:flutter/material.dart';
import 'package:play_book_ui/ui/components/library_empty_section.dart';

class SeriesScreen extends StatelessWidget {
  const SeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LibraryEmptySection(
        icon: "images/ic_book_collection.png",
        label: "Books in Series",
        description: "Here you'll find your books organized by series");
  }
}
