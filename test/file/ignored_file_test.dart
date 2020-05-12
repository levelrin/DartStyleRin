/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'package:dart_style_rin/file/ignored_file.dart';
import 'package:test/test.dart';

void main() {
  group('IgnoredFile', () {
    test('.check() should throw an exception.', () {
      expect(
        () => IgnoredFile().check(),
        throwsUnsupportedError
      );
    });
    test('.format() should throw an exception.', () {
      expect(
          () => IgnoredFile().format(),
        throwsUnsupportedError
      );
    });
  });
}
