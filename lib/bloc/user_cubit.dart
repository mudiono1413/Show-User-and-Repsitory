import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_github_cubit/model/user_moder.dart';
import 'package:user_github_cubit/service/api.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.repository) : super(const UserState());

  int page = 1;
  final RestDataSource repository;

  void loadUser({key = 'doraemon'}) {
    if (state.status == UserStatus.initial) {
      if (state.users.isNotEmpty) {
        state.users.clear();
        page = 1;
      }
    }
    repository
        .getUserPerPage(key: key, page: page, limit: '15')
        .then((List<UserModel> newUsers) {
      page++;

      List<UserModel> dataUser = newUsers;
      emit(state.copyWith(
          users: List.of(state.users)..addAll(dataUser),
          isFirstFetch: page,
          status: UserStatus.success));
    });
  }

  void loadAllUser({int page = 0, String key = 'doraemon'}) async {
    const int _postLimit = 10;
    int _pageCount = 0;

    if (state.status == UserStatus.initial) {
      if (state.users.isNotEmpty) {
        state.users.clear();
      }
      repository.getUserPerPage(key: key).then((List<UserModel> newPosts) {
        List<UserModel> dataUser = newPosts;

        int startRowIndex = page * _postLimit;
        int endRowIndex = startRowIndex + _postLimit;
        _pageCount = (dataUser.length / _postLimit).ceil();

        if (endRowIndex > dataUser.length) {
          endRowIndex = dataUser.length;
        }

        emit(state.copyWith(
            users: dataUser,
            paggingUsers: dataUser
                .getRange(startRowIndex, endRowIndex)
                .toList(growable: false),
            status: UserStatus.success,
            pageCount: _pageCount));
      });
    } else {
      int startRowIndex = page * _postLimit;
      int endRowIndex = startRowIndex + _postLimit;
      _pageCount = (state.users.length / _postLimit).ceil();

      if (endRowIndex > state.users.length) {
        startRowIndex = startRowIndex - _postLimit;
        endRowIndex = state.users.length;
      }

      emit(state.copyWith(
          users: state.users,
          paggingUsers: state.users
              .getRange(startRowIndex, endRowIndex)
              .toList(growable: false),
          status: UserStatus.success));
    }
  }

  void changeStatus() {
    emit(state.copyWith(status: UserStatus.initial));
  }
}
