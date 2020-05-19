/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'dart:io' as io;
import 'package:dart_style_rin/log/log.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/rule/spaces_in_for.dart';
import 'package:dart_style_rin/source/source.dart';
import 'package:test/test.dart';

void main() {

  /// Invalid content.
  String invalid;

  /// Valid content.
  String valid;

  setUpAll(() {
    invalid = io.File('test/rule/spaces_in_for/invalid.txt').readAsStringSync();
    valid = io.File('test/rule/spaces_in_for/valid.txt').readAsStringSync();
  });

  group('SpacesInFor', () {
    test('.check() should give feedback if the spaces in a for loop is wrong.', () {
      final Log log = SilentLog();
      expect(
        SpacesInFor(log).check(
          Source(invalid, log)
        ).length,
        greaterThan(0)
      );
    });
    test('.check() should not give feedback if the spaces in a for loop is correct.', () {
      final Log log = SilentLog();
      expect(
        SpacesInFor(log).check(
          Source(valid, log)
        ).length,
        0
      );
    });
    test('.format() should put spaces into the for loop in a correct way.', () {
      final Log log = SilentLog();
      expect(
        SpacesInFor(log).format(
          Source(invalid, log)
        ),
        Source(valid, log)
      );
    });
  });

}
