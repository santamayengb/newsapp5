import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:newsapp5/Model/model.dart';

part 'hive_state.dart';

class HiveCubit extends Cubit<HiveState> {
<<<<<<< HEAD
  final Box<DataModel> box;
  HiveCubit(this.box) : super(const HiveState(dataModel: [])) {
    box.listenable();
    emit(HiveState(dataModel: [...state.dataModel.toList()]));
  }

=======
  HiveCubit(this.box) : super(const HiveState(dataModel: []));

  final Box<DataModel> box;

>>>>>>> d5a505e91f1332394aad2cef813d94ebbbebd55c
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
