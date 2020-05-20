/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'dart:io' as io;
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/rule/spaces_in_while.dart';
import 'package:dart_style_rin/source/source.dart';
import 'package:test/test.dart';

void main() {

  /// Invalid content.
  String invalid;

  /// Valid content.
  String valid;

  setUpAll(() {
    invalid = io.File('test/rule/spaces_in_while/invalid.txt').readAsStringSync();
    valid = io.File('test/rule/spaces_in_while/valid.txt').readAsStringSync();
  });

  group('SpacesInWhile', () {
    test('.check() should give feedback if the while statement has incorrect number of spaces.', () {
      final SilentLog log = SilentLog();
      expect(
        SpacesInWhile(log).check(
          Source(invalid, log)
        ).length,
        greaterThan(0)
      );
    });
    test('.check() should not give feedback if the while statement has correct number of spaces.', () {
      final SilentLog log = SilentLog();
      expect(
        SpacesInWhile(log).check(
          Source(valid, log)
        ).length,
        0
      );
    });
    test('.format() should put spaces into the while statements in a correct way.', () {
      final SilentLog log = SilentLog();
      expect(
        SpacesInWhile(log).format(
          Source(invalid, log)
        ),
        Source(valid, log)
      );
    });
  });

}
