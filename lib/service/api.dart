import 'package:flutter/foundation.dart';
import 'package:user_github_cubit/model/issue_model.dart';
import 'package:user_github_cubit/model/respository_model.dart';
import 'package:user_github_cubit/model/user_moder.dart';
import 'package:user_github_cubit/service/network_util.dart';
import 'package:user_github_cubit/utils/constant.dart';

class RestDataSource {
  NetworkUtil netUtil = NetworkUtil();
  static const baseUrl = Constant.baseUrl;

  // user
  static const usersUrl = baseUrl + "/users";
  // issue
  static const issueUrl = baseUrl + "/issues";
  // repositories
  static const repositoryUrl = baseUrl + "/repositories";

  Future<List<UserModel>> getUserPerPage(
      {String? key, int? page, String? limit}) async {
    // final queryParameters = {'q': key,'per_page': limit};
    final queryParameters = {
      'q': key,
      'page': page.toString(),
      'per_page': limit
    };

    Uri uri = Uri.parse(usersUrl);
    final newURI = uri.replace(queryParameters: queryParameters);
   
    return await netUtil.get(newURI).then((dynamic res) {
      return compute(userFromJson, res);
    });
  }

  Future<List<IssueModel>> getIssue(
      {String? key, int? page, String? limit}) async {
    // final queryParameters = {'q': key,'per_page': limit};
    final queryParameters = {
      'q': key,
      'page': page.toString(),
      'per_page': limit
    };

    Uri uri = Uri.parse(issueUrl);
    final newURI = uri.replace(queryParameters: queryParameters);
  
    return await netUtil.get(newURI).then((dynamic res) {
      return compute(issueFromJson, res);
    });
  }

    Future<List<RepositoryModel>> getRepository(
      {String? key, int? page, String? limit}) async {
    // final queryParameters = {'q': key,'per_page': limit};
    final queryParameters = {
      'q': key,
      'page': page.toString(),
      'per_page': limit
    };

    Uri uri = Uri.parse(repositoryUrl);
    final newURI = uri.replace(queryParameters: queryParameters);
    
    return await netUtil.get(newURI).then((dynamic res) {
      return compute(repositoryFromJson, res);
    });
  }
}
