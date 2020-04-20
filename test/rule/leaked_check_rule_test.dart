/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/feedback/feedback.dart';
import 'package:dart_style_rin/rule/ignored_rule.dart';
import 'package:dart_style_rin/rule/leaked_check_rule.dart';
import 'package:dart_style_rin/source/ignored_source.dart';
import 'package:test/test.dart';

void main() {
  group('LeakedCheckRule', () {
    test('.check() should return the injected value.', () {
      expect(
        LeakedCheckRule(
          IgnoredRule(),
          <Feedback>[]
        ).check(
          IgnoredSource()
        ),
        <Feedback>[]
      );
    });
    test('.format() should use the original object.', () {
      expect(
        () => LeakedCheckRule(
          IgnoredRule(),
          <Feedback>[]
        ).format(
          IgnoredSource()
        ),
        throwsUnsupportedError
      );
    });
  });
}
