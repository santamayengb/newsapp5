import 'package:auto_route/annotations.dart';
import 'package:newsapp5/Routes/router.dart';

import '../Pages/pages.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      page: MainPage,
      path: '/',
      children: [
        AutoRoute(
          name: 'HomeTab',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: HomePage,
            ),
            AutoRoute(
              page: DetialNewsPage,
            ),
            AutoRoute(page: NewsPage),
          ],
        ),
        AutoRoute(
          name: 'BookmarkTab',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: BookmarkPage,
            ),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}
