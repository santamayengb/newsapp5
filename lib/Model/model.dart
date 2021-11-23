import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsFeedModel {
  NewsFeedModel({
    required this.category,
    required this.data,
    required this.success,
  });

  final String category;
  final List<Datum> data;
  final bool success;

  factory NewsFeedModel.fromJson(Map<String, dynamic> json) =>
      _$NewsFeedModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsFeedModelToJson(this);
}

@JsonSerializable()
class Datum {
  Datum({
    required this.author,
    required this.content,
    required this.imageUrl,
    this.readMoreUrl,
    required this.time,
    required this.title,
    required this.url,
    required this.date,
  });

  final String author;
  final String content;
  final String imageUrl;
  final String? readMoreUrl;
  final String time;
  final String title;
  final String url;
  final String date;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
