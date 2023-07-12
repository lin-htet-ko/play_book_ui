import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:play_book_ui/data/items/book_section_item.dart';
import 'package:play_book_ui/data/items/category_item.dart';
import 'package:play_book_ui/ui/components/book_section.dart';
import 'package:play_book_ui/ui/components/main_empty_book_section.dart';
import 'package:play_book_ui/ui/components/utils.dart';

import '../../../data/items/book_item.dart';
import '../../components/category.dart';

List<CategoryItem> categories = [
  CategoryItem(image: "images/ic_book.png", label: "Genres"),
  CategoryItem(image: "images/ic_gift_bag.png", label: "Top Selling"),
  CategoryItem(image: "images/ic_game.png", label: "New Release"),
  CategoryItem(image: "images/ic_love_brids.png", label: "Romance"),
];

List<BookItem> books = [
  BookItem(
      name: "Secret Project",
      image:
          "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1646363984i/60531420.jpg",
      edition: "Book 4",
      price: 340.14,
      author: "Book Author Name",
      rating: 0,
      reviewCount: 4,
      publication: "Lin Blah Blah Publication",
      releasedDate: "10th Dec 2022",
      pageCount: 130,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
  BookItem(
      name: "Yumi and the Nightmare",
      image:
          "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1688694142i/60531416.jpg",
      edition: "Book 3",
      price: 340.14,
      author: "Book Author Name",
      rating: 0,
      reviewCount: 4,
      publication: "Lin Blah Blah Publication",
      releasedDate: "10th Dec 2022",
      pageCount: 130,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
  BookItem(
      name: "I'm the Evil Load of an Intergalactic Empire",
      image:
          "https://m.media-amazon.com/images/I/81MTZbZCYBL._AC_UF1000,1000_QL80_.jpg",
      edition: "Vol 2",
      price: 230.70,
      author: "Book Author Name",
      rating: 4.8,
      reviewCount: 149,
      publication: "Lin Blah Blah Publication",
      releasedDate: "10th Dec 2022",
      pageCount: 130,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
  BookItem(
      name: "Games Of Throne",
      image:
          "https://m.media-amazon.com/images/M/MV5BN2IzYzBiOTQtNGZmMi00NDI5LTgxMzMtN2EzZjA1NjhlOGMxXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_FMjpg_UX1000_.jpg",
      edition: "Book 1",
      price: 150.08,
      author: "Book Author Name",
      rating: 4.2,
      reviewCount: 4,
      publication: "Lin Blah Blah Publication",
      releasedDate: "10th Dec 2022",
      pageCount: 130,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
  BookItem(
      name: "Ping-pong",
      image:
          "https://assets.lulu.com/cover_thumbs/1/z/1z9evzm8-ebook-shortedge-384.jpg",
      edition: "Book 4",
      price: 1.11,
      author: "Khazin Valeriy",
      rating: 3.7,
      reviewCount: 135,
      publication: "Lin Blah Blah Publication",
      releasedDate: "10th Dec 2022",
      pageCount: 130,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
];

List<BookSectionItem> sections = [
  BookSectionItem(label: "Top Selling Books", books: books),
  BookSectionItem(label: "Sci-fi & fantasy ebooks", books: books),
  BookSectionItem(label: "Recent price drops", books: books),
  BookSectionItem(label: "All the newest ebooks", books: books),
  BookSectionItem(label: "Thrilling & chilling read", books: books),
  BookSectionItem(label: "Recent reduced ebooks", books: books),
  BookSectionItem(label: "Top selling books", books: books)
];

class HomeScreen extends StatefulWidget {
  HomeScreen(this.rootContext, {super.key}) {
    mCategories = categories;
    mSections = sections;
  }

  late List<CategoryItem> mCategories;
  late List<BookSectionItem> mSections;
  final BuildContext rootContext;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeScreenStateless(
        categories: widget.mCategories,
        sections: widget.mSections,
        onTapShop: () {},
        onTapCategory: (item) {},
        onTapSection: (item) {},
        onTapBookItem: (item) {
          widget.rootContext.go("/detail?id=${item.id}");
        });
  }
}

class HomeScreenStateless extends StatelessWidget {
  const HomeScreenStateless(
      {super.key,
      required this.categories,
      required this.sections,
      required this.onTapShop,
      required this.onTapCategory,
      required this.onTapSection,
      required this.onTapBookItem});

  final List<CategoryItem> categories;
  final List<BookSectionItem> sections;
  final void Function() onTapShop;
  final void Function(CategoryItem) onTapCategory;
  final void Function(BookSectionItem) onTapSection;
  final void Function(BookItem) onTapBookItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: CustomScrollView(
          primary: true,
          slivers: [
            SliverToBoxAdapter(
              child: MainEmptyBookSection(onTapShop: onTapShop),
            ),
            const SliverToBoxAdapter(
              child: Text(
                "Explore Play Books",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.all(10),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (con, index) => Category(
                      category: categories[index], onTap: onTapCategory),
                  itemCount: categories.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      generalSpaceWidth(),
                ),
              ),
            ),
            SliverList.separated(
                itemBuilder: (con, index) => BookSection(
                      section: sections[index],
                      onTapItem: onTapBookItem,
                      onTapSeeAll: onTapSection,
                    ),
                separatorBuilder: (con, item) => smallSpaceHeight(),
                itemCount: sections.length)
          ],
        ),
      ),
    );
  }
}
