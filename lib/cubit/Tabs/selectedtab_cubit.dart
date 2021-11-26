import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'selectedtab_state.dart';

class SelectedTabCubit extends Cubit<TabstateState> {
  SelectedTabCubit() : super(const TabstateState(selected: "all"));

  void selectTab(String tab) {
    emit(TabstateState(selected: tab));
  }

  bool isSelected(String tab) {
    return state.selected == tab;
  }
}
