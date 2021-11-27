import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp5/Model/model.dart';

class Service {
  static const baseUrl = "https://inshortsapi.vercel.app/news?category=";

  Future<NewsFeedModel> getData(String category) async {
    try {
      final res = await http.get(Uri.parse(baseUrl + category));
      final newfeed = NewsFeedModel.fromJson(jsonDecode(res.body));
      return newfeed;
    } catch (e) {
      return throw Exception(e.toString());
    }
  }
}
