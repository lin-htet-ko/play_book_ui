import 'package:flutter/material.dart';
import 'package:play_book_ui/ui/components/utils.dart';

class MainEmptyBookSection extends StatelessWidget {
  const MainEmptyBookSection({super.key, required this.onTapShop});

  final void Function() onTapShop;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Let's find your next read",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          generalSpaceHeight(),
          const Text(
            "From romance to superhero, we have tons of books for all your interests",
            textAlign: TextAlign.center,
          ),
          generalSpaceHeight(),
          FloatingActionButton.extended(
            onPressed: onTapShop,
            label: const Text("Shop for books"),
          )
        ],
      ),
    );
  }
}
