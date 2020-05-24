/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'dart:io' as io;
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/rule/no_line_breaks_before_equal.dart';
import 'package:dart_style_rin/source/source.dart';
import 'package:test/test.dart';

void main() {

  /// Invalid content.
  String invalid;

  /// Valid content.
  String valid;

  setUpAll(() {
    invalid = io.File('test/rule/no_line_breaks_before_equal/invalid.txt').readAsStringSync();
    valid = io.File('test/rule/no_line_breaks_before_equal/valid.txt').readAsStringSync();
  });

  group('NoLineBreaksBeforeEqual', () {
    test('.check() should give feedback if there is a line break before the equal sign.', () {
      final SilentLog log = SilentLog();
      expect(
        NoLineBreaksBeforeEqual(log).check(
          Source(invalid, log)
        ).length,
        greaterThan(0)
      );
    });
    test('.check() should not give feedback if there is no line break before the equal sign.', () {
      final SilentLog log = SilentLog();
      expect(
        NoLineBreaksBeforeEqual(log).check(
          Source(valid, log)
        ).length,
        0
      );
    });
    test('.format() should remove line breaks before the equal sign.', () {
      final SilentLog log = SilentLog();
      expect(
        NoLineBreaksBeforeEqual(log).format(
          Source(invalid, log)
        ),
        Source(valid, log)
      );
    });
  });

}
