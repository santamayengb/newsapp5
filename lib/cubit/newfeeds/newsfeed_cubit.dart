import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newsapp5/Model/model.dart';
import 'package:newsapp5/Serivce/service.dart';

part 'newsfeed_state.dart';

class NewsfeedCubit extends Cubit<NewsfeedState> {
  NewsfeedCubit(this.repo) : super(const NewsfeedState(status: Status.initial));
  final NewsFeedRepository repo;
  Future<void> getNewsFeeds(String categoryName) async {
    if (isLoading) return;

    emit(const NewsfeedState(status: Status.loading));
    try {
      final newsfeed = await repo.getData(categoryName);
      emit(NewsfeedState(status: Status.loaded, newsFeedModel: newsfeed));
    } catch (e) {
      emit(const NewsfeedState(status: Status.error));
    }
  }

  bool get isLoading => state.status == Status.loading;
}
