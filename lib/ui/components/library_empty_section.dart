import 'package:flutter/material.dart';

import 'utils.dart';

class LibraryEmptySection extends StatelessWidget {
  const LibraryEmptySection(
      {super.key,
      required this.icon,
      required this.label,
      required this.description,
      this.actionButton});

  final String icon;
  final String label;
  final String description;
  final Widget? actionButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            icon,
            width: 100,
          ),
          generalSpaceHeight(),
          space2XHeight(),
          Text(
            label,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
          ),
          generalSpaceHeight(),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15),
          ),
          generalSpaceHeight(),
          actionButton ?? generalSpaceWidth()
        ],
      ),
    );
  }
}
