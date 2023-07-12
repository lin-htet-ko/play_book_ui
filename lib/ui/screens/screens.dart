import 'package:flutter/material.dart';

import '../../navigations/routes.dart';

abstract class Screens {
  abstract String label;
  abstract String route;
}

abstract class MainScreens extends Screens {
  abstract IconData icon;
  abstract int id;
  abstract bool isSelected;
}

class HomeRouteScreen implements MainScreens {
  HomeRouteScreen({required this.label});

  @override
  IconData icon = Icons.home_filled;

  @override
  int id = 0;

  @override
  String label;

  @override
  String route = routeMainHome;

  @override
  bool isSelected = true;
}

class LibraryRouteScreen implements MainScreens {
  LibraryRouteScreen({required this.label});

  @override
  IconData icon = Icons.library_books;

  @override
  int id = 1;

  @override
  String label;

  @override
  String route = routeMainLibrary;

  @override
  bool isSelected = false;
}

class WishlistRouteScreen implements MainScreens {
  WishlistRouteScreen({required this.label});

  @override
  IconData icon = Icons.bookmark_add;

  @override
  int id = 2;

  @override
  String label;

  @override
  String route = routeMainWishlist;

  @override
  bool isSelected = false;
}

class BookDetailScreen implements Screens {
  BookDetailScreen({required this.label});

  @override
  String label;

  @override
  String route = routeBookDetail;
}
