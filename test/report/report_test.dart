/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/feedback/feedback.dart';
import 'package:dart_style_rin/line/line.dart';
import 'package:dart_style_rin/log/list_log.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/report/report.dart';
import 'package:test/test.dart';

void main() {
  group('Report', () {
    test('.pass() should return true if no feedback.', () {
      expect(
        Report(
          SilentLog()
        ).pass(),
        true
      );
    });
    test('.pass() should return false if there is feedback.', () {
      final SilentLog log = SilentLog();
      final Report report = Report(log)..addFeedback(
        <Feedback>[
          Feedback(
            Line('Apple', 1, log),
            'Banana',
            log
          )
        ]
      );
      expect(
        report.pass(),
        false
      );
    });
    test('.print() should write all feedback on the console.', () {
      final List<String> messages = <String>[];
      final ListLog log = ListLog(messages);
      Report(log)..addFeedback(
        <Feedback>[
          Feedback(
            Line('Apple', 1, log),
            'Banana',
            log
          ),
          Feedback(
            Line('Orane', 2, log),
            'Wiki',
            log
          )
        ]
      )..addFeedback(
        <Feedback>[
          Feedback(
            Line('Uno', 3, log),
            'Dos',
            log
          )
        ]
      )..print();
      expect(messages.length, 3);
    });
  });
}
