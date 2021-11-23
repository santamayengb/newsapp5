import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp5/cubit/newsfeed_cubit.dart';

class MultiProviderWrapper extends StatelessWidget {
  const MultiProviderWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsfeedCubit(),
      child: child,
    );
  }
}
