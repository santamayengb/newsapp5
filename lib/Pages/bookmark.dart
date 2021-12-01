import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:newsapp5/cubit/hive/hive_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<HiveCubit>().state;
    final news = state.dataModel;
    log(news[0].author);

    return Scaffold(
        body: Center(
      child: Text(news.length.toString()),
    ));
  }
}
