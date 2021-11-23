import 'package:flutter/material.dart';

import 'package:newsapp5/App/multi_provider_wrapper.dart';
import 'package:newsapp5/Routes/routes.gr.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiProviderWrapper(
      child: MaterialApp.router(
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
