/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'dart:io';
import 'package:dart_style_rin/io/directory/leaked_entities_dir.dart';
import 'package:test/test.dart';

void main() {
  group('LeakedEntitiesDir', () {
    final List<File> files = <File>[];
    test('.listSync() should return the injected object.', () {
      expect(
        LeakedEntitiesDir(
          files
        ).listSync(),
        same(files)
      );
    });
    test('should throw an exception for other methods.', () {
      expect(
        () => LeakedEntitiesDir(
          <File>[]
        ).list(),
        throwsUnsupportedError
      );
    });
  });
}
