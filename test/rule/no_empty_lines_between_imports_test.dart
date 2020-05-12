/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/rule/no_empty_lines_between_imports.dart';
import 'package:dart_style_rin/source/source.dart';
import 'package:test/test.dart';

void main() {
  group('NoEmptyLinesBetweenImports', () {
    test('.check() should give feedback if it finds empty lines between imports.', () {
      final SilentLog log = SilentLog();
      expect(
        NoEmptyLinesBetweenImports(log).check(
          Source(_invalid(), log)
        ).length,
        greaterThan(0)
      );
    });
    test('.check() should not give feedback if it could not find empty lines between imports.', () {
      final SilentLog log = SilentLog();
      expect(
        NoEmptyLinesBetweenImports(log).check(
          Source(_valid, log)
        ).length,
        0
      );
    });
    test('.format()', () {
      final SilentLog log = SilentLog();
      expect(
        NoEmptyLinesBetweenImports(log).format(
          Source(_invalid(), log)
        ),
        Source(_valid, log)
      );
    });
  });
}

/// Replace the placeholders (-) to line breaks.
String _invalid() {
  return _rawInvalid.replaceAll('-', '\n');
}

/// We use the hyphen (-) as the placeholder for the line break.
const String _rawInvalid = '''
/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import '../feedback/feedback.dart';
import '../line/line.dart';-
import '../log/log.dart';-
import '../source/source.dart';
import 'rule.dart';

/// import 'rule.dart';
''';

const String _valid = '''
/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import '../feedback/feedback.dart';
import '../line/line.dart';
import '../log/log.dart';
import '../source/source.dart';
import 'rule.dart';

/// import 'rule.dart';
''';
