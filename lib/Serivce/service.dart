import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp5/Model/model.dart';

class Service {
  static const baseUrl = "https://inshortsapi.vercel.app/news?category=";

  Future<NewsFeedModel> getData(String category) async {
    final res = await http.get(Uri.parse(baseUrl + category));
    final newfeed = NewsFeedModel.fromJson(jsonDecode(res.body));
    return newfeed;
  }
}
