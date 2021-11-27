import 'package:flutter/material.dart';
import 'package:newsapp5/App/multi_provider_wrapper.dart';
import '../Routes/router.dart';

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
        debugShowCheckedModeBanner: false,
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(),
      ),
    );
  }
}
