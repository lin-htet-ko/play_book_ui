import 'package:flutter/material.dart';
import 'package:play_book_ui/ui/screens/home/home_screen.dart';
import 'package:play_book_ui/ui/screens/library/library_screen.dart';
import 'package:play_book_ui/ui/screens/wishlist/wishlist_screen.dart';

import '../screens.dart';

List<MainScreens> bottomNavItems = [
  HomeRouteScreen(label: "Home"),
  LibraryRouteScreen(label: "Library"),
  WishlistRouteScreen(label: "Wishlist"),
];

class MainScreen extends StatefulWidget {
  const MainScreen(this.rootContext, {super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();

  final BuildContext rootContext;
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var currentItem =
        bottomNavItems.firstWhere((element) => element.isSelected);
    Widget? screen = null;
    switch (currentItem.id) {
      case 0:
        screen = HomeScreen(widget.rootContext);
        break;
      case 1:
        screen = LibraryScreen();
        break;
      case 2:
        screen = WishlistScreen();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        toolbarHeight: 70,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0.1, color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                hintText: "Search Play Books",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                      foregroundImage: NetworkImage(
                          "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg")),
                )),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            bottomNavItems.firstWhere((element) => element.isSelected).id,
        items: bottomNavItems
            .map((e) =>
                BottomNavigationBarItem(icon: Icon(e.icon), label: e.label))
            .toList(),
        onTap: (index) {
          var tempList = bottomNavItems.map((e) {
            var temp = e;
            temp.isSelected = temp.id == index;
            return temp;
          }).toList();

          setState(() {
            bottomNavItems = tempList;
          });
        },
      ),
      body: screen,
    );
  }
}
