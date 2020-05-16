/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'dart:io' as io;
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/rule/indentation.dart';
import 'package:dart_style_rin/source/source.dart';
import 'package:test/test.dart';

void main() {

  /// Invalid content.
  String invalid;

  /// Valid content.
  String valid;

  setUpAll(() {
    invalid = io.File('test/rule/indentation/invalid.txt').readAsStringSync();
    valid = io.File('test/rule/indentation/valid.txt').readAsStringSync();
  });

  group('Indentation', () {
    test('.check() should give feedback if the indentation is wrong.', () {
      final SilentLog log = SilentLog();
      expect(
        Indentation(log).check(
          Source(invalid, log)
        ).length,
        greaterThan(0)
      );
    });
    test('.check() should not give feedback if the indentation is correct.', () {
      final SilentLog log = SilentLog();
      expect(
        Indentation(log).check(
          Source(valid, log)
        ).length,
        0
      );
    });
    test('.format() should indent the code.', () {
      final SilentLog log = SilentLog();
      expect(
        Indentation(log).format(
          Source(invalid, log)
        ),
        Source(valid, log)
      );
    });
  });

}
