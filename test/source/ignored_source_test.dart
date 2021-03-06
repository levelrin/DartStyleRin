/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'package:dart_style_rin/source/ignored_source.dart';
import 'package:test/test.dart';

void main() {
  group('IgnoredSource', () {
    test('.lines() should throw an exception.', () {
      expect(
        () => IgnoredSource().lines(),
        throwsUnsupportedError
      );
    });
    test('.toString() should throw an exception', () {
      expect(
        () => IgnoredSource().toString(),
        throwsUnsupportedError
      );
    });
  });
}
