import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({
    Key? key,
    required this.readMore,
  }) : super(key: key);

  final String readMore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NewsApp"),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: readMore,
      ),
    );
  }
}
