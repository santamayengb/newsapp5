import 'package:flutter/material.dart';
import 'package:newsapp5/App/app.dart';
import 'package:newsapp5/Model/model.dart';

import './Routes/router.dart';
import 'package:hive_flutter/hive_flutter.dart';

main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NewsFeedModelAdapter());
  Hive.registerAdapter(DataModelAdapter());
<<<<<<< HEAD
  final box = await Hive.openBox<DataModel>("Box");
=======
  await Hive.openBox<DataModel>('Box');
  final box = Hive.box<DataModel>('box');

>>>>>>> d5a505e91f1332394aad2cef813d94ebbbebd55c
  runApp(MyApp(
    box: box,
    appRouter: AppRouter(),
  ));
}
