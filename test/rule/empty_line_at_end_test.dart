/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/rule/empty_line_at_end.dart';
import 'package:dart_style_rin/source/source.dart';
import 'package:test/test.dart';

void main() {
  group('EmptyLineAtEnd', () {
    test('.check() should give feedback if the file does not end with the empty line.', () {
      final SilentLog log = SilentLog();
      expect(
        EmptyLineAtEnd(log).check(
          Source(_invalid, log)
        ).length,
        greaterThan(0)
      );
    });
    test('.check() should not give feedback if the file ends with the empty line.', () {
      final SilentLog log = SilentLog();
      expect(
        EmptyLineAtEnd(log).check(
          Source(_valid, log)
        ).length,
        0
      );
    });
    test('.format() should add an empty line at the end of the file.', () {
      final SilentLog log = SilentLog();
      expect(
        EmptyLineAtEnd(log).format(
          Source(_invalid, log)
        ),
        Source(_valid, log)
      );
    });
    test('.format() should not change format of the already valid code.', () {
      final SilentLog log = SilentLog();
      expect(
        EmptyLineAtEnd(log).format(
          Source(_valid, log)
        ),
        Source(_valid, log)
      );
    });
  });
}

const String _invalid = '''
Apple

Banana

Orange''';

const String _valid = '''
Apple

Banana

Orange
''';
