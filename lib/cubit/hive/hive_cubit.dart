import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:newsapp5/Model/model.dart';

part 'hive_state.dart';

class HiveCubit extends Cubit<HiveState> {
  final Box<DataModel> box;
  HiveCubit(this.box) : super(const HiveState(dataModel: [])) {
    box.listenable();
    emit(HiveState(dataModel: [...state.dataModel.toList()]));
  }

  toggleLike(DataModel dataModel) {
    box.put(dataModel.author, dataModel);
    emit(HiveState(dataModel: [...box.values.toList()]));
  }

  isAvailable(DataModel dataModel) {
    if (box.containsKey(dataModel.author)) {
      updateData();
      return true;
    } else {
      updateData();
      return false;
    }
  }

  delete(DataModel dataModel) {
    box.delete(dataModel.author);
    updateData();
  }

  updateData() {
    emit(HiveState(dataModel: [...box.values.toList()]));
  }

  clearAll() {
    box.clear();
    emit(HiveState(dataModel: [...box.values.toList()]));
  }
}
