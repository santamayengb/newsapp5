import 'package:flutter/material.dart';
import 'package:newsapp5/App/app.dart';
import 'package:newsapp5/Model/model.dart';

import './Routes/router.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box box;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NewsFeedModelAdapter());
  Hive.registerAdapter(DatumAdapter());
  box = await Hive.openBox<Datum>("News");

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}
