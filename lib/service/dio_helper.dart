import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:user_github_cubit/utils/constant.dart';

class DioHelper {
  late Dio _dio;
  final JsonDecoder decoder = const JsonDecoder();
  static const baseUrl = Constant.baseUrl;

  // user
  static const usersUrl = baseUrl + "/users";

  DioHelper() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<dynamic> getUser({String? limit}) async {
    // try {
      final queryParameters = {'q': 'doraemon','per_page':limit};
      var response = await _dio.get('/users', queryParameters: queryParameters);
      return response.data;

      // print("respon dio " + response.data['items'].toString());
      // var listProfileData = List<UserModel>.from(
      //     response.data['items'].map((e) => UserModel.fromJson(e)));
      // return Right(listProfileData);
    // } on DioError catch (error) {
    //   return Left('$error');
    // }
  }
}
