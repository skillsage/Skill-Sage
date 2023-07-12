library skillsage_providers;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:skill_sage_app/models/_index.dart';
import 'package:skill_sage_app/utils/_index.dart';
import 'package:dio/dio.dart';

part 'user.dart';
part 'settings.dart';
part "http.dart";

NetworkUtil _networkUtil = NetworkUtil();
