import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkUtil extends ChangeNotifier {
  static NetworkUtil instance = NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => instance;

  final JsonDecoder decoder = const JsonDecoder();

  Future<dynamic> get(Uri url, {Map<String, String>? headers}) {
    return http.get(url, headers: headers).then((http.Response response) {
      // print(" satatus code " + response.body);
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400) {
        throw Exception("Error while fetching data");
      }
      return decoder.convert(res);
    });
  }
}
