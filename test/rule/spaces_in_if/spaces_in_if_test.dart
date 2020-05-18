/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'dart:io' as io;
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/rule/spaces_in_if.dart';
import 'package:dart_style_rin/source/source.dart';
import 'package:test/test.dart';

void main() {

  /// Invalid content.
  String invalid;

  /// Invalid content that contains the indented if statement.
  String invalidIndentedIf;

  /// Valid content.
  String valid;

  setUpAll(() {
    invalid = io.File('test/rule/spaces_in_if/invalid.txt').readAsStringSync();
    invalidIndentedIf = io.File('test/rule/spaces_in_if/invalid_indented_if.txt').readAsStringSync();
    valid = io.File('test/rule/spaces_in_if/valid.txt').readAsStringSync();
  });

  group('SpacesInIf', () {
    test('.check() should give feedback if the if-statements have spaces in a wrong way.', () {
      final SilentLog log = SilentLog();
      expect(
        SpacesInIf(log).check(
          Source(invalid, log)
        ).length,
        greaterThan(0)
      );
    });
    test('.check() should give feedback if the if-statements have spaces in a wrong way 2.', () {
      final SilentLog log = SilentLog();
      expect(
        SpacesInIf(log).check(
          Source(invalidIndentedIf, log)
        ).length,
        greaterThan(0)
      );
    });
    test('.check() should not give feedback if the if-statements have spaces in a correct way.', () {
      final SilentLog log = SilentLog();
      expect(
        SpacesInIf(log).check(
          Source(valid, log)
        ).length,
        0
      );
    });
    test('.format() should put spaces into the if-statements in a correct way.', () {
      final SilentLog log = SilentLog();
      expect(
        SpacesInIf(log).format(
          Source(invalid, log)
        ),
        Source(valid, log)
      );
    });
  });
}
