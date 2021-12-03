import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:newsapp5/Model/model.dart';

part 'hive_state.dart';

class HiveCubit extends Cubit<HiveState> {
  HiveCubit() : super(const HiveState(dataModel: [], isLiked: false));

  final box = Hive.box<DataModel>('Box');

  isLiked(bool isLiked, DataModel dataModel) {
    final title = dataModel.title.substring(0, 15);
    if (isLiked == true) {
      log(isLiked.toString());
      box.put(title, dataModel);
      updateData();
    } else {
      log(isLiked.toString());
      box.delete(title);
      updateData();
    }
  }

  updateData() {
    emit(HiveState(dataModel: box.values.toList()));
  }

  clearAll() async {
    box.clear();
    updateData();
  }
}
