library providers;

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import 'package:skill_sage_app/models/_index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'user.dart';
part 'settings.dart';
part "http.dart";
part 'recommendation.dart';
part 'courses.dart';
part 'job.dart';

FutureOr<Resp<dynamic>> cather(Future<Response> Function() func) async {
  try {
    final res = await func.call();
    return Resp(success: res.data["success"], result: res.data["result"]);
  } catch (e) {
    if (e is DioException) {
      if (e.response != null) {
        // print('err: ${e.response!.data}');
        final res = e.response!;
        final data = res.data["detail"];
        if (data is String) {
          return Resp(success: false, error: data);
        }
        final result = data["result"] as String;
        return Resp(success: data["success"], error: result);
      }
    }
    rethrow;
  }
}

class Resp<T> {
  bool success;
  T? result;
  String? error;
  Resp({required this.success, this.result, this.error});

  Resp<U?> parse<U>(U Function(dynamic) parser) {
    U? parsed;
    if (result != null) {
      if (result is List) {
        throw Exception("Data is a list, use parseList method instead.");
      } else {
        parsed = parser(result);
      }
      return Resp(success: success, error: error, result: parsed);
    }

    return Resp(success: success, error: error, result: null);
  }

  Resp<List<U?>> parseList<U>(U Function(Map<String, dynamic>) parser) {
    List<U?> parsedList;
    if (result != null) {
      if (result is List) {
        final mapData = result as List;
        parsedList = mapData.map((e) => parser(e)).toList();
      } else {
        throw Exception("Data is not a list, use parse method instead.");
      }
      return Resp(success: success, error: error, result: parsedList);
    }
    return Resp(success: false, error: error, result: null);
  }

  toNull() {
    return Resp(success: success, error: error, result: null);
  }
}
