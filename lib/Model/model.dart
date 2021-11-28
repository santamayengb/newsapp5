import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(explicitToJson: true)
class NewsFeedModel extends HiveObject {
  NewsFeedModel({
    required this.category,
    required this.data,
    required this.success,
  });
  @HiveField(0)
  final String category;
  @HiveField(1)
  final List<Datum> data;
  @HiveField(2)
  final bool success;

  factory NewsFeedModel.fromJson(Map<String, dynamic> json) =>
      _$NewsFeedModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsFeedModelToJson(this);
}

@HiveType(typeId: 2)
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
  @HiveField(0)
  final String author;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final String imageUrl;
  @HiveField(3)
  final String? readMoreUrl;
  @HiveField(4)
  final String time;
  @HiveField(5)
  final String title;
  @HiveField(6)
  final String url;
  @HiveField(7)
  final String date;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
