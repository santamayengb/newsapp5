import 'package:flutter/material.dart';
import 'package:newsapp5/Model/model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:newsapp5/Routes/router.dart';

class DetialNewsPage extends StatelessWidget {
  const DetialNewsPage({
    Key? key,
    required this.datum,
  }) : super(key: key);

  final Datum datum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff6200EE),
          title: const Text("NewsApp"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.amber,
                height: 220,
                child: SizedBox(
                  width: 500,
                  child: Image.network(
                    datum.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      datum.author,
                      style: const TextStyle(color: Colors.orange),
                    ),
                    Text(
                      datum.title,
                    ),
                    Text(datum.date.toUpperCase(),
                        style: const TextStyle(color: Colors.orange)),
                    Text(
                      datum.content,
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: TextButton(
                    onPressed: () {
                      context.router.push(
                          NewsRoute(readMore: datum.readMoreUrl.toString()));
                    },
                    child: const Text("Read More")))
          ],
        ));
  }
}
