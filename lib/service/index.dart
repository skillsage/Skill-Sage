library skillsage_services;

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:skill_sage_app/models/_index.dart';
import 'package:skill_sage_app/providers/_index.dart';

part 'user_service.dart';

class Resp<T> {
  bool success;
  T result;
  Resp(this.success, this.result);

  factory Resp.parseSuccess(Response res, T Function(dynamic json) func) {
    final success = res.data["success"] as bool;
    final result = res.data["result"];
    return Resp(success, func(result));
  }

  static Resp<String> parseError(Response res) {
    final success = res.data["detail"]["success"] as bool;
    final result = res.data["detail"]["result"] as String;
    return Resp(success, result);
  }
}

class RespException implements Exception {
  String cause;
  RespException(this.cause);
}
