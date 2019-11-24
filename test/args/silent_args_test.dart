/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/args/silent_args.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:test/test.dart';

void main() {
  group('SilentArgs', () {
    test('.check() should not throw exception.', () {
      expect(
        () => SilentArgs().check(),
        returnsNormally
      );
    });
    test('.debug() should not throw exception.', () {
      expect(
        () => SilentArgs().debug(),
        returnsNormally
      );
    });
    test('.files() should not throw exception.', () {
      expect(
          () => SilentArgs().files(
            SilentLog()
          ),
        returnsNormally
      );
    });
  });
}
