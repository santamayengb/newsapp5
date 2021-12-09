import 'package:cached_network_image/cached_network_image.dart';
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
  Widget build(BuildContext context) {
    final state = context.watch<HiveCubit>().state;
    final news = state.dataModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6200EE),
        title: const Text('Bookmark'),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      context.read<HiveCubit>().clearAll();
                    },
                    child: const Text("Clear All")),
              )
            ],
          )
        ],
      ),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                          child: CachedNetworkImage(
                        imageUrl: news[index].imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, String text) =>
                            const Center(child: CircularProgressIndicator()),
                      ))),
                ),
                Expanded(
                    flex: 6,
                    child: ListTile(
                      title: Text(news[index].author),
                      subtitle: Text(news[index].title),
                    )),
                Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: () =>
                            context.read<HiveCubit>().delete(news[index]),
                        icon: const Icon(Icons.remove)))
              ],
            ),
          );
        },
      ),
    );
  }
}


// ListTile(
//             title: Text(news[index].title),
//             subtitle: Text(news[index].content),
//             trailing: IconButton(
//               icon: const Icon(Icons.delete),
//               onPressed: () {
//                 log(index.toString());
//                 context.read<HiveCubit>().deleteData(news[index].title);
//               },
//             ),
//           );