import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../constants.dart';

class CustomLogger {
  static final CustomLogger _singleton = new CustomLogger._internal();

  factory CustomLogger() {
    return _singleton;
  }

  CustomLogger._internal();

  void logServiceSuccess(Response response) {
    if (Constants.shouldDebugPrint) {
      debugPrint('*******RESPONSE*******');
      debugPrint('${response.statusCode}');
      debugPrint('${response.request}');
      debugPrint('*********END*********\n');
    }
  }

  void logServiceError(Response response) {
    log('Status Code: ' + response.statusCode.toString(),
        time: DateTime.now(),
        name: response.request.toString(),
        error: response,
        stackTrace: StackTrace.current);
    if (Constants.shouldDebugPrint) {
      debugPrint('*******RESPONSE*******');
      debugPrint('${response.statusCode}');
      debugPrint('${response.request}');
      debugPrint('*********END*********\n');
    }
  }

  void logError(Error error) {
    log('Error: $error}',
        time: DateTime.now(),
        name: 'Error',
        error: error,
        stackTrace: StackTrace.current);
    if (Constants.shouldDebugPrint) {
      debugPrint('*******ERROR*******');
      debugPrint('${error.toString()}');
      debugPrint('*********END*********\n');
    }
  }
}
