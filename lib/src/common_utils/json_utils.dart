import 'dart:convert';

import 'package:flutter/foundation.dart';

class JsonUtils {
  ///fromJson is generate function. EX: VideoObject.fromJson
  ///ex: List<Obj> objs = parserJsonToArray(jsonText, Obj.fromJson)
  static Future<List<T>> parserJsonToArray<T>(String responseBody,
      T Function(Map<String, dynamic> json) fromJson) async {
    try {
      return await compute(
            (String message) => (jsonDecode(message) as List).map((jsonObj) => fromJson(jsonObj)).toList(),
        responseBody,
      );
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///fromJson is generate function. EX: VideoObject.fromJson
  ///ex: Obj obj = parserJsonToObj(jsonText, Obj.fromJson)
  static Future<T> parserJsonToObj<T>(String responseBody, T Function(Map<String, dynamic> json) fromJson) async {
    try {
      return await compute(
            (String message) => fromJson(jsonDecode(responseBody)),
        responseBody,
      );
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  JsonUtils._();
}
