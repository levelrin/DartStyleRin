/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/io/file/leaked_content_io_file.dart';
import 'package:test/test.dart';

void main() {
  group('LeakedContentIoFile', () {
    test('.readAsStringSync() should return the injected content.', () {
      expect(
        const LeakedContentIoFile('apple').readAsStringSync(),
        'apple'
      );
    });
    test('should throw an exception for other methods.', () {
      expect(
        () => const LeakedContentIoFile('banana').path,
        throwsUnsupportedError
      );
    });
  });
}
