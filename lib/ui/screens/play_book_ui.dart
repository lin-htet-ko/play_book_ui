import 'package:flutter/material.dart';
import 'package:play_book_ui/navigations/go_router_impl.dart';

class PlayBookUIApp extends StatelessWidget {
  const PlayBookUIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouterImpl.goRouters,
    );
  }
}
