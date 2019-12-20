import 'dart:async';
import 'dart:core' as prefix0;
import 'dart:core';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/src/shared/constants.dart';
import 'package:hello_world/src/shared/utils/custom_logger.dart';
import 'package:http/http.dart';

var log = [];

main() {
  Constants.shouldDebugPrint = false;

  setUp(() {});

  group('Custom Logger: logServiceSuccess', () {
    test('shouldDebugprint set to true', overridePrint(() {
      Constants.shouldDebugPrint = true;
      log = [];
      Response response = new Response('test', HttpStatus.accepted);
      CustomLogger().logServiceSuccess(response);
      expect(
        log,
        ['*******RESPONSE*******', '202', 'null', '*********END*********', ''],
      );
    }));

    test('shouldDebugprint set to false', overridePrint(() {
      Constants.shouldDebugPrint = false;
      log = [];
      Response response = new Response('test', HttpStatus.accepted);
      CustomLogger().logServiceSuccess(response);
      expect(
        log,
        [],
      );
    }));
  });

  group('Custom Logger: logServiceError', () {
    test('shouldDebugprint set to true', overridePrint(() {
      Constants.shouldDebugPrint = true;
      log = [];
      Response response = new Response('test', HttpStatus.accepted);
      CustomLogger().logServiceError(response);
      expect(
        log,
        ['*******RESPONSE*******', '202', 'null', '*********END*********', ''],
      );
    }));

    test('shouldDebugprint set to false', overridePrint(() {
      Constants.shouldDebugPrint = false;
      log = [];
      Response response = new Response('test', HttpStatus.accepted);
      CustomLogger().logServiceError(response);
      expect(
        log,
        [],
      );
    }));
  });

  group('Custom Logger: logError', () {
    test('shouldDebugprint set to true', overridePrint(() {
      Constants.shouldDebugPrint = true;
      log = [];
      CustomLogger().logError(new Error());
      expect(
        log,
        [
          '*******ERROR*******',
          'Instance of \'Error\'',
          '*********END*********',
          ''
        ],
      );
    }));

    test('shouldDebugprint set to false', overridePrint(() {
      Constants.shouldDebugPrint = false;
      log = [];
      CustomLogger().logError(new Error());
      expect(
        log,
        [],
      );
    }));
  });
}

overridePrint(testFn()) => () {
      var spec = new ZoneSpecification(print: (_, __, ___, String msg) {
        // Add to log instead of printing to stdout
        log.add(msg);
      });
      return Zone.current.fork(specification: spec).run(testFn);
    };
