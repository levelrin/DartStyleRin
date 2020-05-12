/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'package:dart_style_rin/io/directory/silent_dir.dart';
import 'package:test/test.dart';

void main() {
  group('SilentDir', () {
    test('.listSync() should not throw an exception.', () {
      expect(
        () => SilentDir().listSync(),
        returnsNormally
      );
    });
    test('Undefined method should throw an exception.', () {
      expect(
        () => SilentDir().list(),
        throwsUnsupportedError
      );
    });
  });
}
