import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp5/cubit/hive/hive_cubit.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  void initState() {
    context.read<HiveCubit>().updateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HiveCubit>().state;
    final news = state.dataModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
      ),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(news[index].title),
            subtitle: Text(news[index].content),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                log(index.toString());
                context.read<HiveCubit>().deleteData(index);
              },
            ),
          );
        },
      ),
    );
  }
}
