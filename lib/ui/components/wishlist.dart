import 'package:flutter/material.dart';
import 'package:play_book_ui/data/items/book_item.dart';
import 'package:play_book_ui/ui/components/utils.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key, required this.book});

  final BookItem book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Image.network(
                  book.image,
                  height: 100,
                  width: 70,
                  fit: BoxFit.cover,
                ),
                Positioned(
                    right: 2,
                    top: 2,
                    child: InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.bookmark_add,
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.8),
                      ),
                    ))
              ],
            ),
          ),
          generalSpaceWidth(),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  book.name,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                generalSpaceHeight(),
                Text(book.author),
                generalSpaceHeight(),
                Row(
                  children: [
                    Text(book.rating.toString()),
                    smallSpaceWidth(),
                    const Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                      size: 15,
                    ),
                    smallSpaceWidth(),
                    Text(book.reviewCount.toInt().toString())
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: ElevatedButton(
            onPressed: () {},
            child: Text("\$ ${book.price}"),
          ))
        ],
      ),
    );
  }
}
