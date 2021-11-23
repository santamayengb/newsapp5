import 'package:auto_route/annotations.dart';
import 'package:newsapp5/Pages/detail_news_page.dart';
import 'package:newsapp5/Pages/home_page.dart';
import 'package:newsapp5/Pages/newspage.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(page: HomePage, initial: true),
  AutoRoute(page: DetialNewsPage),
  AutoRoute(page: NewsPage)
])
class $AppRouter {}
