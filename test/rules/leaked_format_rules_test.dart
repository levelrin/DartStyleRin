/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/report/ignored_report.dart';
import 'package:dart_style_rin/rules/ignored_rules.dart';
import 'package:dart_style_rin/rules/leaked_check_rules.dart';
import 'package:dart_style_rin/rules/leaked_format_rules.dart';
import 'package:dart_style_rin/source/ignored_source.dart';
import 'package:dart_style_rin/source/source.dart';
import 'package:test/test.dart';

void main() {
  group('LeakedFormatRules', () {
    test('.check() should use the original object.', () {
      bool used = false;
      LeakedFormatRules(
        LeakedCheckRules(
          IgnoredRules(),
          (Source source) {
            used = true;
            return IgnoredReport();
          }
        ),
        (Source source) {
          throw UnsupportedError('This should not be used.');
        }
      ).check(
        IgnoredSource()
      );
      expect(used, true);
    });
    test('.format() should use the injected function.', () {
      bool used = false;
      LeakedFormatRules(
        IgnoredRules(),
        (Source source) {
          used = true;
          return IgnoredSource();
        }
      ).format(
        IgnoredSource()
      );
      expect(used, true);
    });
  });
}
