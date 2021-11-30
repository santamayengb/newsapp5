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
      body: ValueListenableBuilder(
        valueListenable: Hive.box('newsBookmarkBox').listenable(),
        builder: (context, Box box, _) {
          return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                final data = box.getAt(index) as Datum;
                return ListTile(
                  title: Text(data.author),
                  trailing: IconButton(
                      onPressed: () {
                        box.deleteAt(index);
                      },
                      icon: const Icon(Icons.delete)),
                );
              });
        },
      ),
    );
  }
}








// }
// ValueListenableBuilder(
//         valueListenable: Hive.box('newsBookmarkBox').listenable(),
//         builder: (context, Box box, _) {
//           return ListView.builder(
//             itemCount: box.length,
//             itemBuilder: (context, index) {
//               final news = box.getAt(index) as Datum;
//               return ListTile(
//                 title: Text(news.title),
//                 subtitle: Text(news.content),
//                 trailing: IconButton(
//                   icon: const Icon(Icons.delete),
//                   onPressed: () {
//                     box.deleteAt(index);
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),