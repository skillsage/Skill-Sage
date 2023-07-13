library skillsage_providers;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:skill_sage_app/models/_index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'user.dart';
part 'settings.dart';
part "http.dart";

FutureOr<Resp<dynamic>> cather(Future<Response> Function() func) async {
  try {
    final res = await func.call();
    return Resp(success: res.data["success"], result: res.data["result"]);
  } catch (e) {
    if (e is DioException) {
      if (e.response != null) {
        print(e.response);
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
    if (result != null) {
      final parsed = parser(result);
      return Resp(success: success, error: error, result: parsed);
    }

    return Resp(success: success, error: error, result: null);
  }

  toNull() {
    return Resp(success: success, error: error, result: null);
  }
}
