import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// // import 'package:newsapp5/Model/model.dart';

// import 'package:newsapp5/main.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    // Datum data = box.get("News");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmark"),
      ),
      // body: ValueListenableBuilder<Box>(
      //     valueListenable: Hive.box('News').listenable(),
      //     builder: (context, box, _) {
      //       final news = box.values.toList().cast<Datum>();
      //       return Center(
      //         child: Text(news.length.toString()),
      //       );
      //     })
    );
  }
}
