part of 'tabstate_cubit.dart';

class TabstateState extends Equatable {
  const TabstateState({
    required this.selected,
  });

  final String selected;

  @override
  List<Object> get props => [selected];
}
