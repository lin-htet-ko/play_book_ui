import 'package:flutter/material.dart';
import 'package:play_book_ui/ui/screens/library/your_book/your_book.dart';

import 'series/series.dart';
import 'shelves/shelves.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 0.2,
          toolbarHeight: 0,
          bottom: TabBar(
            tabs: [
              Tab(text: "Your books"),
              Tab(text: "Shelves"),
              Tab(text: "Series"),
            ],
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Theme.of(context).primaryColor,
          ),
        ),
        body: TabBarView(children: [
          YourBookEmpty(),
          ShelvesScreen(),
          SeriesScreen(),
        ]),
      ),
    );
  }
}
