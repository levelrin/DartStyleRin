/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'dart:io' as io;
import 'package:dart_style_rin/feedback/feedback.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/rule/no_consecutive_empty_lines.dart';
import 'package:dart_style_rin/source/source.dart';
import 'package:test/test.dart';

void main() {

  /// Invalid content.
  String invalid;

  /// Valid content.
  String valid;

  setUpAll(() {
    invalid = io.File('test/rule/no_consecutive_empty_lines/invalid.txt').readAsStringSync();
    valid = io.File('test/rule/no_consecutive_empty_lines/valid.txt').readAsStringSync();
  });

  group('NoConsecutiveEmptyLines', () {
    test('.check() should give feedback if consecutive empty lines were found.', () {
      final SilentLog log = SilentLog();
      final List<Feedback> feedbackList = NoConsecutiveEmptyLines(log).check(
        Source(invalid, log)
      );
      expect(
        feedbackList.length,
        greaterThan(0)
      );
    });
    test('.check() should not give feedback if consecutive empty lines were not found.', () {
      final SilentLog log = SilentLog();
      final List<Feedback> feedbackList = NoConsecutiveEmptyLines(log).check(
        Source(valid, log)
      );
      expect(feedbackList, isEmpty);
    });
    test('.format() should remove all consecutive line breaks.', () {
      final SilentLog log = SilentLog();
      expect(
        NoConsecutiveEmptyLines(log).format(
          Source(invalid, log)
        ),
        Source(valid, log)
      );
    });
  });
}
