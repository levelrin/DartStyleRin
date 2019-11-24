/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/rule/leaked_code_rule.dart';
import 'package:dart_style_rin/source/ignored_source.dart';
import 'package:test/test.dart';

void main() {
  group('LeakedCodeRule', () {
    test('.check() should return the injected exit code.', () {
      expect(
        const LeakedCodeRule(2).check(IgnoredSource()),
        2
      );
    });
    test('.format() should return the injected exit code.', () {
      expect(
        const LeakedCodeRule(2).format(IgnoredSource()),
        2
      );
    });
  });
}
