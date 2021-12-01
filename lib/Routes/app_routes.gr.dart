// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../Model/model.dart' as _i5;
import '../Pages/pages.dart' as _i1;
import 'router.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    HomeTab.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    BookmarkTab.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    DetialNewsRoute.name: (routeData) {
      final args = routeData.argsAs<DetialNewsRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.DetialNewsPage(key: args.key, dataModel: args.datum));
    },
    NewsRoute.name: (routeData) {
      final args = routeData.argsAs<NewsRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.NewsPage(key: args.key, readMore: args.readMore));
    },
    BookmarkRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.BookmarkPage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(MainRoute.name, path: '/', children: [
          _i3.RouteConfig(HomeTab.name,
              path: 'empty-router-page',
              parent: MainRoute.name,
              children: [
                _i3.RouteConfig(HomeRoute.name, path: '', parent: HomeTab.name),
                _i3.RouteConfig(DetialNewsRoute.name,
                    path: 'detial-news-page', parent: HomeTab.name),
                _i3.RouteConfig(NewsRoute.name,
                    path: 'news-page', parent: HomeTab.name)
              ]),
          _i3.RouteConfig(BookmarkTab.name,
              path: 'empty-router-page',
              parent: MainRoute.name,
              children: [
                _i3.RouteConfig(BookmarkRoute.name,
                    path: '', parent: BookmarkTab.name)
              ])
        ])
      ];
}

/// generated route for [_i1.MainPage]
class MainRoute extends _i3.PageRouteInfo<void> {
  const MainRoute({List<_i3.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for [_i2.EmptyRouterPage]
class HomeTab extends _i3.PageRouteInfo<void> {
  const HomeTab({List<_i3.PageRouteInfo>? children})
      : super(name, path: 'empty-router-page', initialChildren: children);

  static const String name = 'HomeTab';
}

/// generated route for [_i2.EmptyRouterPage]
class BookmarkTab extends _i3.PageRouteInfo<void> {
  const BookmarkTab({List<_i3.PageRouteInfo>? children})
      : super(name, path: 'empty-router-page', initialChildren: children);

  static const String name = 'BookmarkTab';
}

/// generated route for [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for [_i1.DetialNewsPage]
class DetialNewsRoute extends _i3.PageRouteInfo<DetialNewsRouteArgs> {
  DetialNewsRoute({_i4.Key? key, required _i5.DataModel datum})
      : super(name,
            path: 'detial-news-page',
            args: DetialNewsRouteArgs(key: key, datum: datum));

  static const String name = 'DetialNewsRoute';
}

class DetialNewsRouteArgs {
  const DetialNewsRouteArgs({this.key, required this.datum});

  final _i4.Key? key;

  final _i5.DataModel datum;

  @override
  String toString() {
    return 'DetialNewsRouteArgs{key: $key, datum: $datum}';
  }
}

/// generated route for [_i1.NewsPage]
class NewsRoute extends _i3.PageRouteInfo<NewsRouteArgs> {
  NewsRoute({_i4.Key? key, required String readMore})
      : super(name,
            path: 'news-page',
            args: NewsRouteArgs(key: key, readMore: readMore));

  static const String name = 'NewsRoute';
}

class NewsRouteArgs {
  const NewsRouteArgs({this.key, required this.readMore});

  final _i4.Key? key;

  final String readMore;

  @override
  String toString() {
    return 'NewsRouteArgs{key: $key, readMore: $readMore}';
  }
}

/// generated route for [_i1.BookmarkPage]
class BookmarkRoute extends _i3.PageRouteInfo<void> {
  const BookmarkRoute() : super(name, path: '');

  static const String name = 'BookmarkRoute';
}
