/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/rule/no_trailing_spaces.dart';
import 'package:dart_style_rin/source/source.dart';
import 'package:test/test.dart';

void main() {
  group('NoTrailingSpaces', () {
    test('.check() should give feedback if it finds trailing spaces.', () {
      final SilentLog log = SilentLog();
      expect(
        NoTrailingSpaces(log).check(
          Source(_invalid(), log)
        ).length,
        greaterThan(0)
      );
    });
    test('.check() should not give feedback if it could not find trailing spaces.', () {
      final SilentLog log = SilentLog();
      expect(
        NoTrailingSpaces(log).check(
          Source(_valid, log)
        ).length,
        0
      );
    });
    test('.format() should remove the trailing spaces.', () {
      final SilentLog log = SilentLog();
      expect(
        NoTrailingSpaces(log).format(
          Source(_invalid(), log)
        ),
        Source(_valid, log)
      );
    });
  });
}

/// Replace the placeholders.
String _invalid() {
  return _rawInvalid
    .replaceAll('*', ' ')
    .replaceAll('-', '\t');
}

/// We use placeholders such as asterisks (*) for spaces and hyphens (-) for tabs.
const String _rawInvalid = '''
Apple**
Banana**--
Orange
''';

const String _valid = '''
Apple
Banana
Orange
''';
