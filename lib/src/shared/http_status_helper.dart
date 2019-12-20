import 'dart:io';

import 'package:hello_world/src/shared/utils/custom_logger.dart';
import 'package:http/http.dart';

class HttpStatusHelper {
  static bool checkResponseStatus(Response response) {
    if (response.statusCode == HttpStatus.ok) {
      CustomLogger().logServiceSuccess(response);
      return true;
    }

    CustomLogger().logServiceError(response);
    return false;
  }
}
