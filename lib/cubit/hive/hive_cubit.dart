import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:newsapp5/Model/model.dart';

part 'hive_state.dart';

class HiveCubit extends Cubit<HiveState> {
  HiveCubit() : super(const HiveState(dataModel: []));

  final box = Hive.box<DataModel>('Box');

  Future<void> addData(DataModel dataModel) async {
    final title = dataModel.title.substring(0, 15);
    box.put(title, dataModel);
    updateData();
  }

  deleteData(String title, int index) {
    log(title);
    log(index.toString());
    box.deleteAt(index);

    emit(HiveState(dataModel: box.values.toList()));
  }

  updateData() {
    emit(HiveState(dataModel: box.values.toList()));
  }

  clearAll() async {
    box.clear();
    updateData();
  }
}
