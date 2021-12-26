part of 'repository_cubit.dart';


class RepositoryState extends Equatable {
  final RepositoryStatus status;
  final List<RepositoryModel> repositories;
  final List<RepositoryModel> paggingRepositories;
  final List<RepositoryModel> oldRepositories;
  final int isFirstFetch;
  final int pageCount;

  const RepositoryState(
      {this.status = RepositoryStatus.initial,
      this.repositories = const <RepositoryModel>[],
      this.paggingRepositories = const <RepositoryModel>[],
      this.oldRepositories = const <RepositoryModel>[],
      this.isFirstFetch = 1,
      this.pageCount = 0});

  RepositoryState copyWith(
      {RepositoryStatus? status,
      List<RepositoryModel>? repositories,
      List<RepositoryModel>? paggingRepositories,
      List<RepositoryModel>? oldRepositories,
      int? isFirstFetch,
      int? pageCount}) {
    return RepositoryState(
        status: status ?? this.status,
        repositories: repositories ?? this.repositories,
        paggingRepositories: paggingRepositories ?? this.paggingRepositories,
        oldRepositories: oldRepositories ?? this.oldRepositories,
        isFirstFetch: isFirstFetch ?? this.isFirstFetch,
        pageCount: pageCount ?? this.pageCount);
  }

  @override
  String toString() {
    return '''IssueState { status: $status, Issues: ${repositories.length}  ''';
  }

  @override
  List<Object?> get props =>
      [status, repositories, paggingRepositories, oldRepositories, isFirstFetch];
}

enum RepositoryStatus { initial, success, failure }
