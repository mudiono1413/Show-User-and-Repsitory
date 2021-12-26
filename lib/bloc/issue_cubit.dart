import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_github_cubit/model/issue_model.dart';
import 'package:user_github_cubit/service/api.dart';

part 'issue_state.dart';

class IssueCubit extends Cubit<IssueState> {
  IssueCubit(this.repository) : super(const IssueState());

  int page = 1;
  final RestDataSource repository;

  void loadIssue({ key = 'doraemon'}) {
    if (state.status == IssueStatus.initial) {
      if (state.issues.isNotEmpty) {
        state.issues.clear();
        page =1;
      }
    }
    repository
        .getIssue(key: key, page: page, limit: '15')
        .then((List<IssueModel> newIssues) {
      page++;

      List<IssueModel> dataIssue = newIssues;
      emit(state.copyWith(
          issues: List.of(state.issues)..addAll(dataIssue),
          isFirstFetch: page,
          status: IssueStatus.success));
    });
  }

  void loadAllIssue({int page = 0, String key = 'doraemon'}) async {
    const int _postLimit = 10;
    int _pageCount = 0;

    if (state.status == IssueStatus.initial) {

      if (state.issues.isNotEmpty) {
        state.issues.clear();
      }
      repository.getIssue(key: key).then((List<IssueModel> newIssues) {
        List<IssueModel> dataIssue = newIssues;

        int startRowIndex = page * _postLimit;
        int endRowIndex = startRowIndex + _postLimit;
        _pageCount = (dataIssue.length / _postLimit).ceil();

        if (endRowIndex > dataIssue.length) {
          endRowIndex = dataIssue.length;
        }

        emit(state.copyWith(
            issues: dataIssue,
            paggingIssues: dataIssue
                .getRange(startRowIndex, endRowIndex)
                .toList(growable: false),
            status: IssueStatus.success,
            pageCount: _pageCount));
      });
    } else {
      int startRowIndex = page * _postLimit;
      int endRowIndex = startRowIndex + _postLimit;
      _pageCount = (state.issues.length / _postLimit).ceil();

      if (endRowIndex > state.issues.length) {
        startRowIndex = startRowIndex - _postLimit;
        endRowIndex = state.issues.length;
      }

      emit(state.copyWith(
          issues: state.issues,
          paggingIssues: state.issues
              .getRange(startRowIndex, endRowIndex)
              .toList(growable: false),
          status: IssueStatus.success));
    }
  }

  void changeStatus() {
    emit(state.copyWith(status: IssueStatus.initial));
  }
}
