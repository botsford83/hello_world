import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/src/shared/constants.dart';
import 'package:hello_world/src/shared/http_status_helper.dart';
import 'package:http/http.dart';

main() {
  Constants.shouldDebugPrint = false;
  group('Http Status Helper: checkResponseStatus()', () {
    test('return true if the response status is accepted', () async {
      Response response = new Response('', HttpStatus.ok);
      expect(HttpStatusHelper.checkResponseStatus(response), true);
    });

    test('return false if the response status is not found', () async {
      Response response = new Response('', HttpStatus.notFound);
      expect(HttpStatusHelper.checkResponseStatus(response), false);
    });
  });

  group('Http Status Helper: checkResponseStatus() with bad responses', () {
    test('returns null if the response status is 400', () async {
      Response response = Response('', HttpStatus.badRequest);
      expect(HttpStatusHelper.checkResponseStatus(response), false);
    });

    test('returns null if the response status is 401', () async {
      Response response = Response('', HttpStatus.unauthorized);
      expect(HttpStatusHelper.checkResponseStatus(response), false);
    });

    test('returns null if the response status is 402', () async {
      Response response = Response('', HttpStatus.paymentRequired);
      expect(HttpStatusHelper.checkResponseStatus(response), false);
    });

    test('returns null if the response status is 403', () async {
      Response response = Response('', HttpStatus.forbidden);
      expect(HttpStatusHelper.checkResponseStatus(response), false);
    });

    test('returns null if the response status is 404', () async {
      Response response = Response('', HttpStatus.notFound);
      expect(HttpStatusHelper.checkResponseStatus(response), false);
    });

    test('returns null if the response status is 405', () async {
      Response response = Response('', HttpStatus.methodNotAllowed);
      expect(HttpStatusHelper.checkResponseStatus(response), false);
    });

    test('returns null if the response status is 406', () async {
      Response response = Response('', HttpStatus.notAcceptable);
      expect(HttpStatusHelper.checkResponseStatus(response), false);
    });
  });
}
