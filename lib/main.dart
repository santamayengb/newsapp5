import 'package:flutter/material.dart';
import 'package:newsapp5/App/app.dart';
import 'package:newsapp5/Model/model.dart';

import './Routes/router.dart';
import 'package:hive_flutter/hive_flutter.dart';

main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NewsFeedModelAdapter());
  Hive.registerAdapter(DataModelAdapter());
  final box = await Hive.openBox<DataModel>("Box");
  runApp(MyApp(
    box: box,
    appRouter: AppRouter(),
  ));
}
