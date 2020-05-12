/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'package:dart_style_rin/io/file/leaked_path_io_file.dart';
import 'package:test/test.dart';

void main() {
  group('LeakedPathIoFile', () {
    test('.path should return the injected path.', () {
      expect(
        const LeakedPathIoFile('apple.dart').path,
        'apple.dart'
      );
    });
    test('should throw an exception for other methods.', () {
      expect(
        () => const LeakedPathIoFile('banana.dart').length(),
        throwsUnsupportedError
      );
    });
  });
}
