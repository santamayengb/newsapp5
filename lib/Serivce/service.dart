import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp5/Model/model.dart';

class NewsFeedRepository {
  static const baseUrl = "https://inshortsapi.vercel.app/news?category=";

  Future<NewsFeedModel> getData(String category) async {
    final res = await http.get(Uri.parse(baseUrl + category));
    if (res.statusCode == 200) {
      return NewsFeedModel.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
