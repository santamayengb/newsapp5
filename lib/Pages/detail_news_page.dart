import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:newsapp5/Model/model.dart';
import 'package:newsapp5/cubit/hive/hive_cubit.dart';

import '../Routes/router.dart';

class DetialNewsPage extends StatefulWidget {
  const DetialNewsPage({
    Key? key,
    required this.dataModel,
  }) : super(key: key);

  final DataModel dataModel;

  @override
  State<DetialNewsPage> createState() => _DetialNewsPageState();
}

class _DetialNewsPageState extends State<DetialNewsPage> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    context.watch<HiveCubit>().state.isLiked;
    context.read<HiveCubit>().updateData();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff6200EE),
          title: const Text("Bookmark"),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
          },
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 500,
                    child: Image.network(
                      widget.dataModel.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.dataModel.author,
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              color: const Color(0xffFFB74D),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                context
                                    .read<HiveCubit>()
                                    .isLiked(isLiked, widget.dataModel);
                                isLiked = !isLiked;
                              },
                              child: isLiked
                                  ? const Icon(Icons.bookmark_border)
                                  : const Icon(Icons.bookmark)),
                        ],
                      ),
                      Text(
                        widget.dataModel.title,
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: const Color(0xff616161),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        widget.dataModel.date.toUpperCase(),
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: const Color(0xff757575),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        widget.dataModel.content,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: const Color(0xff757575),
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: TextButton(
                      onPressed: () {
                        context.router.push(NewsRoute(
                            readMore: widget.dataModel.readMoreUrl.toString()));
                      },
                      child: Text(
                        "Read More",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: const Color(0xffFFB74D),
                          fontWeight: FontWeight.w500,
                        ),
                      )))
            ],
          ),
        ));
  }
}
