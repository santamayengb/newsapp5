import 'package:flutter/material.dart';
import 'package:newsapp5/constant/new_category.dart';
import 'package:newsapp5/cubit/Tabs/selectedtab_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp5/cubit/newfeeds/newsfeed_cubit.dart';

class HeaderTabs extends StatelessWidget {
  const HeaderTabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SelectedTabCubit>().state;
    return Flexible(
      child: ListView(
        addSemanticIndexes: true,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: newsCategories
            .map((e) => TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(state.selected == e
                      ? const Color(0xff6200BE)
                      : Colors.transparent),
                ),
                onPressed: () {
                  context.read<SelectedTabCubit>().selectTab(e);
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
    );
  }
}
