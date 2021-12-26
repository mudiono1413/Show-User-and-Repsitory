part of 'user_cubit.dart';

class UserState extends Equatable {
  final UserStatus status;
  final List<UserModel> users;
  final List<UserModel> paggingUsers;
  final List<UserModel> oldUsers;
  final int isFirstFetch;
  final int pageCount;

  const UserState(
      {this.status = UserStatus.initial,
      this.users = const <UserModel>[],
      this.paggingUsers = const <UserModel>[],
      this.oldUsers = const <UserModel>[],
      this.isFirstFetch = 1,
      this.pageCount = 0});

  UserState copyWith(
      {UserStatus? status,
      List<UserModel>? users,
      List<UserModel>? paggingUsers,
      List<UserModel>? oldUsers,
      int? isFirstFetch,
      int? pageCount}) {
    return UserState(
        status: status ?? this.status,
        users: users ?? this.users,
        paggingUsers: paggingUsers ?? this.paggingUsers,
        oldUsers: oldUsers ?? this.oldUsers,
        isFirstFetch: isFirstFetch ?? this.isFirstFetch,
        pageCount: pageCount ?? this.pageCount);
  }

  @override
  String toString() {
    return '''UserState { status: $status, users: ${users.length}  ''';
  }

  @override
  List<Object?> get props =>
      [status, users, paggingUsers, oldUsers, isFirstFetch];
}

enum UserStatus { initial, success, failure }
