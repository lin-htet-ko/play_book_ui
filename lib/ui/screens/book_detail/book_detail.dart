import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:play_book_ui/data/items/book_item.dart';
import 'package:play_book_ui/ui/components/utils.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key, required this.bookItem});

  final BookItem bookItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        flexibleSpace: BookDetailAppbar(
            onTapBack: () {},
            onTapSearch: () {},
            onTapBookmark: () {},
            onTapShare: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    bookItem.image,
                    width: 120,
                    isAntiAlias: true,
                    fit: BoxFit.cover,
                  ),
                ),
                generalSpaceWidth(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bookItem.name,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                      generalSpaceHeight(),
                      Text(
                        bookItem.author,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      generalSpaceHeight(),
                      Text(
                        bookItem.publication,
                        style: const TextStyle(fontSize: 15),
                      ),
                      Chip(label: Text(bookItem.releasedDate)),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DetailGenre(
                          top: Row(
                            children: [
                              Text(
                                bookItem.rating.round().toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              const Icon(Icons.star),
                            ],
                          ),
                          label: "${bookItem.reviewCount} reviews"),
                      const DetailGenre(
                          top: Icon(Icons.book_outlined), label: "Ebook"),
                      DetailGenre(
                          top: Text(bookItem.pageCount.toString()),
                          label: "Pages"),
                      const DetailGenre(
                          top: Icon(Icons.brightness_high_outlined),
                          label: "Eligible")
                    ],
                  )),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text("Free sample")),
                  ),
                  smallSpaceWidth(),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Buy \$ ${bookItem.price}")),
                  )
                ],
              ),
            ),
            const Divider(),
            const Text(
              "About this ebook",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            generalSpaceHeight(),
            Text(
              bookItem.description,
              style: const TextStyle(height: 1.5),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            space2XHeight(),
            const Text(
              "Rating and reviews",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            generalSpaceHeight(),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      bookItem.rating.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 45),
                    ),
                    ReviewRating(rating: bookItem.rating),
                    smallSpaceHeight(),
                    Text("${bookItem.reviewCount} total")
                  ],
                ),
                const Expanded(
                  child: Column(
                    children: [
                      ReviewProgress(
                        label: "5",
                        rating: 0.8,
                      ),
                      ReviewProgress(
                        label: "4",
                        rating: 0.5,
                      ),
                      ReviewProgress(
                        label: "3",
                        rating: 0.2,
                      ),
                      ReviewProgress(
                        label: "2",
                        rating: 0.1,
                      ),
                      ReviewProgress(
                        label: "1",
                        rating: 0,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              child: Text("About ratings and reviews"),
            ),
            Expanded(
                child: Column(
              children: [
                Review(),
                Review(),
                Review(),
                Review(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class BookDetailAppbar extends StatelessWidget {
  const BookDetailAppbar(
      {super.key,
      required this.onTapBack,
      required this.onTapSearch,
      required this.onTapBookmark,
      required this.onTapShare});

  final void Function() onTapBack;
  final void Function() onTapSearch;
  final void Function() onTapBookmark;
  final void Function() onTapShare;

  @override
  Widget build(BuildContext context) {
    var surface = Theme.of(context).colorScheme.surface;
    var primary = Theme.of(context).colorScheme.primary;

    return AppBar(
      backgroundColor: surface,
      elevation: 0,
      leading: BackButton(
        onPressed: onTapBack,
        color: primary,
      ),
      actions: [
        IconButton(
            onPressed: onTapSearch,
            icon: Icon(
              Icons.search,
              color: primary,
            )),
        IconButton(
          onPressed: onTapBookmark,
          icon: const Icon(Icons.bookmark_add),
          color: primary,
        ),
        IconButton(
          onPressed: onTapShare,
          icon: const Icon(Icons.share),
          color: primary,
        ),
      ],
    );
  }
}

class DetailGenre extends StatelessWidget {
  const DetailGenre({super.key, required this.top, required this.label});

  final Widget top;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [top, Text(label)],
    );
  }
}

class ReviewProgress extends StatelessWidget {
  const ReviewProgress({super.key, required this.label, required this.rating});

  final String label;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
          generalSpaceWidth(),
          SizedBox(
            width: 200,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.antiAlias,
              child: LinearProgressIndicator(
                value: rating,
                minHeight: 10,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ReviewRating extends StatelessWidget {
  const ReviewRating({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    var primary = Theme.of(context).colorScheme.primary;
    return RatingBar(
        maxRating: 5,
        allowHalfRating: true,
        initialRating: rating,
        minRating: 0,
        itemSize: 19,
        ratingWidget: RatingWidget(
            full: Icon(
              Icons.star,
              color: primary,
            ),
            half: Icon(
              Icons.star_half,
              color: primary,
            ),
            empty: const Icon(
              Icons.star,
              color: Colors.grey,
            )),
        onRatingUpdate: (index) {});
  }
}

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          foregroundImage: NetworkImage(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Pierre-Person.jpg/800px-Pierre-Person.jpg",
          ),
        ),
        generalSpaceWidth(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Raymond Erdey",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              smallSpaceHeight(),
              ReviewRating(rating: 5.0),
              smallSpaceHeight(),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                softWrap: true,
                style: TextStyle(height: 1.5),
              ),
              smallSpaceHeight(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Was this review helpful?"),
                  Row(
                    children: [
                      OutlinedButton(onPressed: () {}, child: Text("Yes")),
                      generalSpaceWidth(),
                      OutlinedButton(onPressed: () {}, child: Text("No")),
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
