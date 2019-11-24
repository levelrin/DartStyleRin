/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/file/silent_file.dart';
import 'package:test/test.dart';

void main() {
  group('SilentFile', () {
    test('.check() should not throw an exception', () {
      expect(
        () => SilentFile().check(),
        returnsNormally
      );
    });
    test('.format() should not throw an exception', () {
      expect(
          () => SilentFile().format(),
        returnsNormally
      );
    });
  });
}
