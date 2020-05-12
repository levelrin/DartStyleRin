/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'package:dart_style_rin/files/ignored_files.dart';
import 'package:dart_style_rin/files/leaked_check_files.dart';
import 'package:test/test.dart';

void main() {
  group('LeakedCheckFiles', () {
    test('.check() should return the injected value.', () {
      expect(
        LeakedCheckFiles(
          IgnoredFiles(),
          true
        ).check(),
        true
      );
    });
    test('.format() should use the original object.', () {
      expect(
        () => LeakedCheckFiles(
          IgnoredFiles(),
          true
        ).format(),
        throwsUnsupportedError
      );
    });
  });
}
