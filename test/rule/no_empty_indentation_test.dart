/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/rule/no_empty_indentation.dart';
import 'package:dart_style_rin/source/source.dart';
import 'package:test/test.dart';

void main() {
  group('NoEmptyIndentation', () {
    test('.check() should give feedback if empty indentation found.', () {
      final SilentLog log = SilentLog();
      expect(
        NoEmptyIndentation(log).check(
          Source(_invalid, log)
        ).length,
        greaterThan(0)
      );
    });
    test('.check() should return true if empty indentation not found.', () {
      final SilentLog log = SilentLog();
      expect(
        NoEmptyIndentation(log).check(
          Source(_valid, log)
        ).length,
        0
      );
    });
    test('.format() should remove empty indentations.', () {
      final SilentLog log = SilentLog();
      expect(
        NoEmptyIndentation(log).format(
          Source(_invalid, log)
        ),
        Source(_valid, log)
      );
    });
  });
}

const String _invalid = '''
class Apple {
  
  String color() {
    return "Red";
  }
  
}
''';

const String _valid = '''
class Apple {

  String color() {
    return "Red";
  }

}
''';
