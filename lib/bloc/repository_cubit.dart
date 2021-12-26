import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_github_cubit/model/respository_model.dart';
import 'package:user_github_cubit/service/api.dart';

part 'repository_state.dart';

class RepositoryCubit extends Cubit<RepositoryState> {
  RepositoryCubit(this.repository) : super(const RepositoryState());

  int page = 1;
  final RestDataSource repository;

  void loadRepository({key = 'doraemon'}) {
    if (state.status == RepositoryStatus.initial) {
      if (state.repositories.isNotEmpty) {
        state.repositories.clear();
        page = 1;
      }
    }
    repository
        .getRepository(key: key, page: page, limit: '15')
        .then((List<RepositoryModel> newRepositories) {
      page++;

      List<RepositoryModel> dataRepositories = newRepositories;
      emit(state.copyWith(
          repositories: List.of(state.repositories)..addAll(dataRepositories),
          isFirstFetch: page,
          status: RepositoryStatus.success));
    });
  }

  void loadAllRepository({int page = 0, String key = 'doraemon'}) async {
    const int _postLimit = 10;
    int _pageCount = 0;

    if (state.status == RepositoryStatus.initial) {
      if (state.repositories.isNotEmpty) {
        state.repositories.clear();
      }
      repository
          .getRepository(key: key)
          .then((List<RepositoryModel> newRepositories) {
        List<RepositoryModel> dataRepository = newRepositories;

        int startRowIndex = page * _postLimit;
        int endRowIndex = startRowIndex + _postLimit;
        _pageCount = (dataRepository.length / _postLimit).ceil();

        if (endRowIndex > dataRepository.length) {
          endRowIndex = dataRepository.length;
        }

        emit(state.copyWith(
            repositories: dataRepository,
            paggingRepositories: dataRepository
                .getRange(startRowIndex, endRowIndex)
                .toList(growable: false),
            status: RepositoryStatus.success,
            pageCount: _pageCount));
      });
    } else {
      int startRowIndex = page * _postLimit;
      int endRowIndex = startRowIndex + _postLimit;
      _pageCount = (state.repositories.length / _postLimit).ceil();

      if (endRowIndex > state.repositories.length) {
        startRowIndex = startRowIndex - _postLimit;
        endRowIndex = state.repositories.length;
      }

      emit(state.copyWith(
          repositories: state.repositories,
          paggingRepositories: state.repositories
              .getRange(startRowIndex, endRowIndex)
              .toList(growable: false),
          status: RepositoryStatus.success));
    }
  }

  void changeStatus() {
    emit(state.copyWith(status: RepositoryStatus.initial));
  }
}
