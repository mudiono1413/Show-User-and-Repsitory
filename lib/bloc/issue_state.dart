part of 'issue_cubit.dart';

class IssueState extends Equatable {
  final IssueStatus status;
  final List<IssueModel> issues;
  final List<IssueModel> paggingIssues;
  final List<IssueModel> oldIssues;
  final int isFirstFetch;
  final int pageCount;

  const IssueState(
      {this.status = IssueStatus.initial,
      this.issues = const <IssueModel>[],
      this.paggingIssues = const <IssueModel>[],
      this.oldIssues = const <IssueModel>[],
      this.isFirstFetch = 1,
      this.pageCount = 0});

  IssueState copyWith(
      {IssueStatus? status,
      List<IssueModel>? issues,
      List<IssueModel>? paggingIssues,
      List<IssueModel>? oldIssues,
      int? isFirstFetch,
      int? pageCount}) {
    return IssueState(
        status: status ?? this.status,
        issues: issues ?? this.issues,
        paggingIssues: paggingIssues ?? this.paggingIssues,
        oldIssues: oldIssues ?? this.oldIssues,
        isFirstFetch: isFirstFetch ?? this.isFirstFetch,
        pageCount: pageCount ?? this.pageCount);
  }

  @override
  String toString() {
    return '''IssueState { status: $status, Issues: ${issues.length}  ''';
  }

  @override
  List<Object?> get props =>
      [status, issues, paggingIssues, oldIssues, isFirstFetch];
}

enum IssueStatus { initial, success, failure }
