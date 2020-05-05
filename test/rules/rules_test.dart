/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/feedback/feedback.dart';
import 'package:dart_style_rin/line/line.dart';
import 'package:dart_style_rin/log/log.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/rule/confirmable_rule.dart';
import 'package:dart_style_rin/rule/leaked_check_rule.dart';
import 'package:dart_style_rin/rule/rule.dart';
import 'package:dart_style_rin/rules/rules.dart';
import 'package:dart_style_rin/source/ignored_source.dart';
import 'package:dart_style_rin/source/source.dart';
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
    test('.format() should apply Rule.format().', () {
      final ConfirmableRule rule = ConfirmableRule();
      Rules(
        <Rule>[rule],
        SilentLog()
      ).format(
        IgnoredSource()
      );
      expect(rule.formatCalled, true);
    });
    test('.format() should return the source, in which all rules are applied.', () {
      final SilentLog log = SilentLog();
      expect(
        Rules(
          <Rule>[
            _AppendRule('Banana', log),
            _AppendRule('Orange', log)
          ],
          log
        ).format(
          Source('Apple', log)
        ),
        Source('AppleBananaOrange', log)
      );
    });
  });
}

/// It's for testing.
/// It appends a text to the source code.
class _AppendRule implements Rule {

  /// Constructor.
  const _AppendRule(this._text, this._log);

  /// We will append this to the source code.
  final String _text;

  /// For logging.
  final Log _log;

  @override
  List<Feedback> check(final Source source) {
    throw UnimplementedError('Please define the behavior.');
  }

  @override
  Source format(final Source source) {
    return Source('${source.toString()}$_text', _log);
  }

}
