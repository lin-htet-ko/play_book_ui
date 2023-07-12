import 'package:go_router/go_router.dart';
import 'package:play_book_ui/navigations/router.dart';
import 'package:play_book_ui/ui/screens/book_detail/book_detail.dart';
import 'package:play_book_ui/ui/screens/home/home_screen.dart';
import 'package:play_book_ui/ui/screens/main/main_screen.dart';

import 'Routes.dart';

class GoRouterImpl implements Router {
  static final goRouters = GoRouter(routes: [
    GoRoute(
        path: routeMain,
        builder: (con, state) {
          return MainScreen(con);
        },
        routes: [
          GoRoute(
              path: routeBookDetail,
              builder: (con, state) {
                var id = int.parse(state.queryParameters["id"] ?? "0");
                return BookDetailScreen(
                  bookItem: books[id],
                );
              })
        ]),
  ]);

  @override
  void navigateDetail(int id) {}

  @override
  void navigateMain() {}
}
