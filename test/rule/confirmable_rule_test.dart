/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'package:dart_style_rin/rule/confirmable_rule.dart';
import 'package:dart_style_rin/source/ignored_source.dart';
import 'package:test/test.dart';

void main() {
  group('ConfirmableRule', () {
    test('We should be able to confirm if check() has been called or not.', () {
      final ConfirmableRule rule = ConfirmableRule();
      expect(rule.checkCalled, false);
      rule.check(
        IgnoredSource()
      );
      expect(rule.checkCalled, true);
    });
    test('We should be able to confirm if format() has been called or not.', () {
      final ConfirmableRule rule = ConfirmableRule();
      expect(rule.formatCalled, false);
      rule.format(
        IgnoredSource()
      );
      expect(rule.formatCalled, true);
    });
  });
}
