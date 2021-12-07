import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:newsapp5/Model/model.dart';

part 'hive_state.dart';

class HiveCubit extends Cubit<HiveState> {
  HiveCubit(Box<DataModel> box) : super(const HiveState(dataModel: [])){
    box.
  }

  final box = Hive.box<DataModel>('Box');

  toggleLike(DataModel dataModel) {
    final chk = box.get(dataModel.author);
    if (chk == null) {
      box.put(dataModel.author, dataModel);
    } else {
      log(chk.toString());
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
