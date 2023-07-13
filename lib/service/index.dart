library skillsage_services;

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:skill_sage_app/models/_index.dart';
import 'package:skill_sage_app/providers/_index.dart';

part 'user_service.dart';

FutureOr<Resp<dynamic>> cather(Future<Response> Function() func) async {
  try {
    final res = await func.call();
    return Resp(success: res.data["success"], result: res.data["result"]);
  } catch (e) {
    if (e is DioException) {
      if (e.response != null) {
        final res = e.response!;
        final success = res.data["detail"]["success"] as bool;
        final result = res.data["detail"]["result"] as String;
        return Resp(success: success, error: result);
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

class RespException implements Exception {
  String cause;
  RespException(this.cause);
}
