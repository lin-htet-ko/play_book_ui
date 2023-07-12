import 'package:flutter/material.dart';

import '../../../components/library_empty_section.dart';

class YourBookEmpty extends StatelessWidget {
  const YourBookEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return LibraryEmptySection(
      icon: "images/ic_book_collection.png",
      label: "Start your collection",
      description:
          "From romance to superheroes, we have a tons of books for all your interest",
      actionButton:
          ElevatedButton(onPressed: () {}, child: Text("Shop for books")),
    );
  }
}
