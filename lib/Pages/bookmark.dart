import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsapp5/Model/model.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmark"),
      ),
      body: FutureBuilder(
          future: Hive.openBox('newsBookmarkBox'),
          builder: (context, snapshot) {
            final box = Hive.box('newsBookmarkBox');
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      final news = box.get(index) as Datum;
                      return ListTile(
                        title: Text(news.author),
                      );
                    });
              } else {
                return const Text("No Data");
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
