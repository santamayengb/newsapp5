import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp5/cubit/Tabs/tabstate_cubit.dart';
import 'package:newsapp5/cubit/newfeeds/newsfeed_cubit.dart';

class MultiProviderWrapper extends StatelessWidget {
  const MultiProviderWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsfeedCubit>(create: (context) => NewsfeedCubit()),
        BlocProvider<TabstateCubit>(create: (context) => TabstateCubit()),
      ],
      child: child,
    );
  }
}
