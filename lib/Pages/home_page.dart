import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:newsapp5/Routes/router.dart';
import 'package:newsapp5/constant/new_category.dart';
import 'package:newsapp5/cubit/Tabs/tabstate_cubit.dart';
import 'package:newsapp5/cubit/newfeeds/newsfeed_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TabstateCubit>().state;
    log(state.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6200EE),
        title: const Text("NewsApp"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Flexible(
            child: ListView(
              addSemanticIndexes: true,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: newsCategories
                  .map((e) => TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            state.selected == e
                                ? const Color(0xff6200BE)
                                : Colors.transparent),
                      ),
                      onPressed: () {
                        context.read<TabstateCubit>().selectTab(e);
                        context.read<NewsfeedCubit>().getNewsFeeds(e);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          e.toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      )))
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
        return RefreshIndicator(
          onRefresh: () =>
              context.read<NewsfeedCubit>().getNewsFeeds(data.category),
          child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              itemCount: data.data.length,
              itemBuilder: (context, index) {
                final fdata = data.data[index];
                return GestureDetector(
                  onTap: () {
                    context.router.push(DetialNewsRoute(datum: fdata));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                  child: CachedNetworkImage(
                                imageUrl: fdata.imageUrl,
                                fit: BoxFit.cover,
                                placeholder: (context, String text) =>
                                    const Center(
                                        child: CircularProgressIndicator()),
                              ))),
                        ),
                        Expanded(
                          flex: 7,
                          child: SizedBox(
                            height: 100,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    fdata.author,
                                    style: GoogleFonts.roboto(
                                        color: const Color(0xFFFFB74D),
                                        fontSize: 12,
                                        fontWeight: FontWeight
                                            .w400), //GoogleFonts.poppins(
                                  ),
                                  SizedBox(
                                    height: 60,
                                    child: Text(
                                      fdata.content,
                                      textScaleFactor: 1.1,
                                      maxLines: 3,
                                      softWrap: true,
                                      textAlign: TextAlign.justify,
                                      style: GoogleFonts.roboto(
                                          color: const Color(0xFF616161),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Text(
                                    '${fdata.time.toUpperCase()} | ${fdata.date.toUpperCase()}',
                                    style: GoogleFonts.roboto(
                                        color: const Color(0xFF616161),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        );
      case Status.error:
        return const Text("error");
    }
  }
}
