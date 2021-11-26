import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tabstate_state.dart';

class TabstateCubit extends Cubit<TabstateState> {
  TabstateCubit() : super(const TabstateState());

  void changeTab(String e) {}
}
