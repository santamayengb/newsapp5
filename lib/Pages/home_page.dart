import 'package:flutter/material.dart';
import 'package:newsapp5/Pages/components/headtabs.dart';
import 'package:newsapp5/Pages/components/news.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6200EE),
        title: const Text("NewsApp"),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: HeaderTabs(),
        ),
      ),
      body: const News(),
    );
  }
}
