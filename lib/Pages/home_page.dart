import 'package:flutter/material.dart';
import 'package:newsapp5/Routes/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:newsapp5/constant/new_category.dart';
import 'package:newsapp5/cubit/newsfeed_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6200EE),
        title: const Text("NewsApp"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Flexible(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: newsCategories
                  .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextButton(
                            onPressed: () =>
                                context.read<NewsfeedCubit>().getNewsFeeds(e),
                            child: Text(
                              e.toUpperCase(),
                              style: const TextStyle(color: Colors.white),
                            )),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
      body: const News(),
    );
  }
}

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  void initState() {
    context.read<NewsfeedCubit>().getNewsFeeds("all");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<NewsfeedCubit>().state;
    final status = state.status;

    switch (status) {
      case Status.initial:
        return Container();
      case Status.loading:
        return const Center(child: CircularProgressIndicator());
      case Status.loaded:
        final data = state.newsFeedModel!;
        return ListView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: data.data.length,
            itemBuilder: (context, index) {
              final fdata = data.data[index];
              return GestureDetector(
                onTap: () {
                  context.router.push(DetialNewsRoute(datum: fdata));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  height: 200,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: SizedBox(
                            width: 150,
                            height: 200,
                            child: ClipRRect(
                                child: Image.network(
                              fdata.imageUrl,
                              fit: BoxFit.cover,
                            ))),
                      ),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                fdata.author,
                                style: const TextStyle(
                                    color: Colors.orange, fontSize: 18),
                              ),
                              Text(
                                fdata.content,
                                maxLines: 8,
                                softWrap: true,
                                textAlign: TextAlign.justify,
                              ),
                              Text(
                                  '${fdata.time.toUpperCase()} | ${fdata.date.toUpperCase()}')
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      case Status.error:
        return const Text("error");
    }
  }
}
