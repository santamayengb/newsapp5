import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:newsapp5/Model/model.dart';

part 'hive_state.dart';

class HiveCubit extends Cubit<HiveState> {
  HiveCubit() : super(const HiveState(dataModel: []));

  final box = Hive.box<DataModel>('Box');

  isLiked(bool isLiked, DataModel dataModel) {
    final title = dataModel.title.substring(0, 15);

    if (isLiked == true) {
      log('HiveCubit if Block: ${isLiked.toString()}');
      box.put(title, dataModel);
      emit(HiveState(dataModel: box.values.toList(), isLiked: isLiked));
    }
    if (isLiked == false) {
      log('HiveCubit Else block: ${isLiked.toString()}');
      box.delete(title);
      emit(HiveState(dataModel: box.values.toList(), isLiked: isLiked));
    }
  }

  updateData() {
    emit(HiveState(
      dataModel: box.values.toList(),
    ));
    log("Updated");
  }

  clearAll() async {
    box.clear();
    updateData();
  }
}
