import 'package:flutter/material.dart';
import 'package:newsapp5/Routes/router.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [HomeTab(), BookmarkTab()],
      bottomNavigationBuilder: (_, tab) {
        return BottomNavigationBar(
          currentIndex: tab.activeIndex,
          type: BottomNavigationBarType.fixed,
          onTap: tab.setActiveIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: "bookmark"),
          ],
        );
      },
    );
  }
}
