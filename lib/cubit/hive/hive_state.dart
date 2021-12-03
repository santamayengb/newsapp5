part of 'hive_cubit.dart';

class HiveState extends Equatable {
  const HiveState({
    required this.dataModel,
    this.isLiked,
  });

  final List<DataModel> dataModel;
  final bool? isLiked;

  @override
  List<Object?> get props => [dataModel];

  HiveState copyWith({
    List<DataModel>? dataModel,
  }) {
    return HiveState(
      dataModel: dataModel ?? this.dataModel,
    );
  }
}
