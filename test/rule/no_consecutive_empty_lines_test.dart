/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/feedback/feedback.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/rule/no_consecutive_empty_lines.dart';
import 'package:dart_style_rin/source/source.dart';
import 'package:test/test.dart';

void main() {
  group('NoConsecutiveEmptyLines', () {
    test('.check() should give feedback if consecutive empty lines were found.', () {
      final SilentLog log = SilentLog();
      final List<Feedback> feedbackList = NoConsecutiveEmptyLines(log).check(
        Source(_invalid(), log)
      );
      expect(
        feedbackList.length,
        greaterThan(0)
      );
    });
    test('.check() should not give feedback if consecutive empty lines were not found.', () {
      final SilentLog log = SilentLog();
      final List<Feedback> feedbackList = NoConsecutiveEmptyLines(log).check(
        Source(_valid, log)
      );
      expect(feedbackList, isEmpty);
    });
    test('.format() should remove all consecutive line breaks.', () {
      final SilentLog log = SilentLog();
      expect(
        NoConsecutiveEmptyLines(log).format(
          Source(_invalid(), log)
        ),
        Source(_valid, log)
      );
    });
  });
}

/// Remove the placeholder and return the invalid code.
String _invalid() {
  return _invalidWithPlaceholder.replaceAll('*', '\n');
}

const String _invalidWithPlaceholder = '''
class Apple {
*
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
