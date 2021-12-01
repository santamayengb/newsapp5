import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:newsapp5/Model/model.dart';

part 'hive_state.dart';

class HiveCubit extends Cubit<HiveState> {
  HiveCubit() : super(const HiveState(dataModel: []));

  Future<void> addData(DataModel dataModel) async {
    await Hive.openBox('Box');
    final newState = state.copyWith(
      dataModel: [...state.dataModel, dataModel],
    );
    emit(newState);
  }

  void deleteData(DataModel dataModel) {}

  void updateData(DataModel dataModel) {}
}
