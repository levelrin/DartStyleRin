/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/file/leaked_code_file.dart';
import 'package:test/test.dart';

void main() {
  group('LeakedCodeFile', () {
    test('.check() should return the injected exit code.', () {
      expect(
        const LeakedCodeFile(2).check(),
        2
      );
    });
    test('.format() should return the injected exit code.', () {
      expect(
        const LeakedCodeFile(2).format(),
        2
      );
    });
  });
}
