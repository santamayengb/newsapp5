// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../Model/model.dart' as _i6;
import '../Pages/detail_news_page.dart' as _i2;
import '../Pages/home_page.dart' as _i1;
import '../Pages/newspage.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    DetialNewsRoute.name: (routeData) {
      final args = routeData.argsAs<DetialNewsRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.DetialNewsPage(key: args.key, datum: args.datum));
    },
    NewsRoute.name: (routeData) {
      final args = routeData.argsAs<NewsRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.NewsPage(key: args.key, readMore: args.readMore));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(HomeRoute.name, path: '/'),
        _i4.RouteConfig(DetialNewsRoute.name, path: '/detial-news-page'),
        _i4.RouteConfig(NewsRoute.name, path: '/news-page')
      ];
}

/// generated route for [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for [_i2.DetialNewsPage]
class DetialNewsRoute extends _i4.PageRouteInfo<DetialNewsRouteArgs> {
  DetialNewsRoute({_i5.Key? key, required _i6.Datum datum})
      : super(name,
            path: '/detial-news-page',
            args: DetialNewsRouteArgs(key: key, datum: datum));

  static const String name = 'DetialNewsRoute';
}

class DetialNewsRouteArgs {
  const DetialNewsRouteArgs({this.key, required this.datum});

  final _i5.Key? key;

  final _i6.Datum datum;

  @override
  String toString() {
    return 'DetialNewsRouteArgs{key: $key, datum: $datum}';
  }
}

/// generated route for [_i3.NewsPage]
class NewsRoute extends _i4.PageRouteInfo<NewsRouteArgs> {
  NewsRoute({_i5.Key? key, required String readMore})
      : super(name,
            path: '/news-page',
            args: NewsRouteArgs(key: key, readMore: readMore));

  static const String name = 'NewsRoute';
}

class NewsRouteArgs {
  const NewsRouteArgs({this.key, required this.readMore});

  final _i5.Key? key;

  final String readMore;

  @override
  String toString() {
    return 'NewsRouteArgs{key: $key, readMore: $readMore}';
  }
}
