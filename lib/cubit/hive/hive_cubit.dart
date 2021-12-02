import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:newsapp5/Model/model.dart';

part 'hive_state.dart';

class HiveCubit extends Cubit<HiveState> {
  HiveCubit() : super(const HiveState(dataModel: []));

  Future<void> addData(DataModel dataModel) async {
    final box = Hive.box<DataModel>('Box');
    box.add(dataModel);

    emit(HiveState(dataModel: box.values.toList()));
  }

  void deleteData(int dataModel) {
    final box = Hive.box<DataModel>('Box');
    log(dataModel.toString());
    box.deleteAt(dataModel);
  }

  void updateData(DataModel dataModel) {}
}
