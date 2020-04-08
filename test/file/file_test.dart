/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/file/file.dart';
import 'package:dart_style_rin/io/file/leaked_content_io_file.dart';
import 'package:dart_style_rin/io/file/silent_io_file.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/rules/ignored_rules.dart';
import 'package:dart_style_rin/rules/leaked_check_rules.dart';
import 'package:dart_style_rin/rules/leaked_format_rules.dart';
import 'package:dart_style_rin/source/silent_source.dart';
import 'package:dart_style_rin/source/source.dart';
import 'package:test/test.dart';

void main() {
  group('File', () {
    test('.check() should let Rules to check the source.', () {
      bool used = false;
      File(
        const LeakedContentIoFile('apple'),
        LeakedCheckRules(
          IgnoredRules(),
          (Source source) {
            used = true;
            return true;
          }
        ),
        SilentLog()
      ).check();
      expect(used, true);
    });
    test('.format() should let Rules to format the source.', () {
      bool used = false;
      File(
        const SilentIoFile(
          LeakedContentIoFile('apple')
        ),
        LeakedFormatRules(
          IgnoredRules(),
          (Source source) {
            used = true;
            return SilentSource();
          }
        ),
        SilentLog()
      ).format();
      expect(used, true);
    });
  });
}
