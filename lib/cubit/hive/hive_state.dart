part of 'hive_cubit.dart';

class HiveState extends Equatable {
  const HiveState({
    required this.dataModel,
  });

  final List<DataModel> dataModel;

  @override
  List<Object?> get props => [dataModel];
}
