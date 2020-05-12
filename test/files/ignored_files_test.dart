/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'package:dart_style_rin/files/ignored_files.dart';
import 'package:test/test.dart';

void main() {
  group('IgnoredFiles', () {
    test('.check() should throw an exception.', () {
      expect(
        () => IgnoredFiles().check(),
        throwsUnsupportedError
      );
    });
    test('.format() should throw an exception.', () {
      expect(
          () => IgnoredFiles().format(),
        throwsUnsupportedError
      );
    });
  });
}
