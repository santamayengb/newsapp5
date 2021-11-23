part of 'newsfeed_cubit.dart';

enum Status {
  initial,
  loading,
  loaded,
  error,
}

class NewsfeedState extends Equatable {
  const NewsfeedState({
    this.newsFeedModel,
    required this.status,
    this.errorMessage,
  });

  final NewsFeedModel? newsFeedModel;
  final Status status;
  final String? errorMessage;

  @override
  List<Object?> get props => [newsFeedModel, status, errorMessage];
}
