import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newsapp5/Model/model.dart';
import 'package:newsapp5/cubit/hive/hive_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  Future h() async {
    final d = await Hive.box('Box').getAt(0) as DataModel;
    log(d.author);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HiveCubit>().state;
    final news = state.dataModel;

    h();

    return Scaffold(
        body: Center(
      child: Text(news.length.toString()),
    ));
  }
}
