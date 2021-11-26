import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tabstate_state.dart';

class TabstateCubit extends Cubit<TabstateState> {
  TabstateCubit() : super(const TabstateState(selected: "all"));

  void selectTab(String tab) {
    emit(TabstateState(selected: tab));
  }
}
