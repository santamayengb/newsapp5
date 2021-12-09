import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsapp5/App/multi_provider_wrapper.dart';
import 'package:newsapp5/Model/model.dart';
=======
import 'package:hive/hive.dart';

import 'package:newsapp5/App/multi_provider_wrapper.dart';
import 'package:newsapp5/Model/model.dart';

>>>>>>> d5a505e91f1332394aad2cef813d94ebbbebd55c
import '../Routes/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.appRouter,
    required this.box,
  }) : super(key: key);

  final Box<DataModel> box;

  final AppRouter appRouter;

  final Box<DataModel> box;

  @override
  Widget build(BuildContext context) {
    return MultiProviderWrapper(
      box: box,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(),
      ),
    );
  }
}
