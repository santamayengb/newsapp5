// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsFeedModelAdapter extends TypeAdapter<NewsFeedModel> {
  @override
  final int typeId = 1;

  @override
  NewsFeedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsFeedModel(
      category: fields[0] as String,
      data: (fields[1] as List).cast<DataModel>(),
      success: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, NewsFeedModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(2)
      ..write(obj.success);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsFeedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DatumAdapter extends TypeAdapter<DataModel> {
  @override
  final int typeId = 2;

  @override
  DataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataModel(
      author: fields[0] as String,
      content: fields[1] as String,
      imageUrl: fields[2] as String,
      readMoreUrl: fields[3] as String?,
      time: fields[4] as String,
      title: fields[5] as String,
      url: fields[6] as String,
      date: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DataModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.author)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.readMoreUrl)
      ..writeByte(4)
      ..write(obj.time)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.url)
      ..writeByte(7)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsFeedModel _$NewsFeedModelFromJson(Map<String, dynamic> json) =>
    NewsFeedModel(
      category: json['category'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => DataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool,
    );

Map<String, dynamic> _$NewsFeedModelToJson(NewsFeedModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'success': instance.success,
    };

DataModel _$DatumFromJson(Map<String, dynamic> json) => DataModel(
      author: json['author'] as String,
      content: json['content'] as String,
      imageUrl: json['imageUrl'] as String,
      readMoreUrl: json['readMoreUrl'] as String?,
      time: json['time'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$DatumToJson(DataModel instance) => <String, dynamic>{
      'author': instance.author,
      'content': instance.content,
      'imageUrl': instance.imageUrl,
      'readMoreUrl': instance.readMoreUrl,
      'time': instance.time,
      'title': instance.title,
      'url': instance.url,
      'date': instance.date,
    };
