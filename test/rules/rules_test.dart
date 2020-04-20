/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/feedback/feedback.dart';
import 'package:dart_style_rin/line/line.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/rule/confirmable_rule.dart';
import 'package:dart_style_rin/rule/leaked_check_rule.dart';
import 'package:dart_style_rin/rule/rule.dart';
import 'package:dart_style_rin/rules/rules.dart';
import 'package:dart_style_rin/source/ignored_source.dart';
import 'package:test/test.dart';

void main() {
  group('Rules', () {
    test('Report should not pass if there is feedback.', () {
      final SilentLog log = SilentLog();
      expect(
        Rules(
          <Rule>[
            LeakedCheckRule.throwable(<Feedback>[]),
            LeakedCheckRule.throwable(
              <Feedback>[
                Feedback(
                  Line('Apple', 1, log),
                  'Banana',
                  log
                )
              ]
            )
          ],
          SilentLog()
        ).check(
          IgnoredSource()
        ).pass(),
        false
      );
    });
    test('.format() should return 2 if there was any erros on formatting.', () {
      final ConfirmableRule rule = ConfirmableRule();
      Rules(
        <Rule>[rule],
        SilentLog()
      ).format(
        IgnoredSource()
      );
      expect(rule.formatCalled, true);
    });
  });
}
