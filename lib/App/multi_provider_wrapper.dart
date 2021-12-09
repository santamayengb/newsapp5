import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsapp5/Model/model.dart';
import 'package:newsapp5/cubit/Tabs/selectedtab_cubit.dart';
import 'package:newsapp5/cubit/hive/hive_cubit.dart';

import 'package:newsapp5/cubit/newfeeds/newsfeed_cubit.dart';

class MultiProviderWrapper extends StatelessWidget {
  const MultiProviderWrapper({
    Key? key,
    required this.child,
    required this.box,
  }) : super(key: key);

  final Widget child;
  final Box<DataModel> box;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsfeedCubit>(create: (context) => NewsfeedCubit()),
        BlocProvider<SelectedTabCubit>(create: (context) => SelectedTabCubit()),
        BlocProvider<HiveCubit>(create: (context) => HiveCubit(box)),
      ],
      child: child,
    );
  }
}
