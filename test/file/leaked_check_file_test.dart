/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/file/ignored_file.dart';
import 'package:dart_style_rin/file/leaked_check_file.dart';
import 'package:test/test.dart';

void main() {
  group('LeakedCheckFile', () {
    test('.check() should return the injected value.', () {
      expect(
        LeakedCheckFile(
          IgnoredFile(),
          false
        ).check(),
        false
      );
    });
    test('.format() should use the original object.', () {
      expect(
        () => LeakedCheckFile(
          IgnoredFile(),
          false
        ).format(),
        throwsUnsupportedError
      );
    });
  });
}
