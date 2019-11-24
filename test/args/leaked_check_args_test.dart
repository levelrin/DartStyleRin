/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/args/ignored_args.dart';
import 'package:dart_style_rin/args/leaked_check_args.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:test/test.dart';

void main() {
  group('LeakedCheckArgs', () {
    test('.check() should return injected value.', () {
      expect(
        LeakedCheckArgs(
          IgnoredArgs(),
          true
        ).check(),
        true
      );
    });
    test('.debug() should use the original object.', () {
      expect(
        () => LeakedCheckArgs(
          IgnoredArgs(),
          true
        ).debug(),
        throwsUnsupportedError
      );
    });
    test('.files() should use the original object.', () {
      expect(
        () => LeakedCheckArgs(
          IgnoredArgs(),
          true
        ).files(
          SilentLog()
        ),
        throwsUnsupportedError
      );
    });
  });
}
