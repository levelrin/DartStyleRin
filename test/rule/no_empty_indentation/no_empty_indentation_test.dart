/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'dart:io' as io;
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/rule/no_empty_indentation.dart';
import 'package:dart_style_rin/source/source.dart';
import 'package:test/test.dart';

void main() {

  /// Invalid content.
  /// IntelliJ IDE may automatically put spaces instead of tabs.
  /// We will use placeholders and programmatically convert them into spaces and tabs.
  String invalidWithPlaceholders;

  /// Valid content.
  String valid;

  setUpAll(() {
    invalidWithPlaceholders = io.File('test/rule/no_empty_indentation/invalid.txt').readAsStringSync();
    valid = io.File('test/rule/no_empty_indentation/valid.txt').readAsStringSync();
  });

  group('NoEmptyIndentation', () {
    test('.check() should give feedback if empty indentation found.', () {
      final SilentLog log = SilentLog();
      expect(
        NoEmptyIndentation(log).check(
          Source(_invalid(invalidWithPlaceholders), log)
        ).length,
        greaterThan(0)
      );
    });
    test('.check() should not give feedback if empty indentation not found.', () {
      final SilentLog log = SilentLog();
      expect(
        NoEmptyIndentation(log).check(
          Source(valid, log)
        ).length,
        0
      );
    });
    test('.format() should remove empty indentations.', () {
      final SilentLog log = SilentLog();
      expect(
        NoEmptyIndentation(log).format(
          Source(_invalid(invalidWithPlaceholders), log)
        ),
        Source(valid, log)
      );
    });
  });
}

/// Convert placeholder characters into spaces and tabs.
/// [invalidWithPlaceholders] The test data with placeholders.
String _invalid(final String invalidWithPlaceholders) {
  return invalidWithPlaceholders
    .replaceAll('**', '\t')
    .replaceAll('--', ' ');
}
