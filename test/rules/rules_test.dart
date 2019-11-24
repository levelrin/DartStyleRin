/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/rule/leaked_code_rule.dart';
import 'package:dart_style_rin/rule/rule.dart';
import 'package:dart_style_rin/rules/rules.dart';
import 'package:dart_style_rin/source/ignored_source.dart';
import 'package:test/test.dart';

void main() {
  group('Rules', () {
    test('.check() should return 2 if the source violates any rule.', () {
      expect(
        Rules(
          const <Rule>[
            LeakedCodeRule(0),
            LeakedCodeRule(2)
          ],
          SilentLog()
        ).check(
          IgnoredSource()
        ),
        2
      );
    });
    test('.format() should return 2 if there was any erros on formatting.', () {
      expect(
        Rules(
          const <Rule>[
            LeakedCodeRule(0),
            LeakedCodeRule(2)
          ],
          SilentLog()
        ).format(
          IgnoredSource()
        ),
        2
      );
    });
  });
}
