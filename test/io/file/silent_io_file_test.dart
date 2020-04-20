/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/io/file/ignored_io_file.dart';
import 'package:dart_style_rin/io/file/leaked_content_io_file.dart';
import 'package:dart_style_rin/io/file/silent_io_file.dart';
import 'package:test/test.dart';

void main() {
  group('SilentIoFile', () {
    test('.writeAsStringSync() should not throw an exception.', () {
      expect(
        () => SilentIoFile(
          IgnoredIoFile()
        ).writeAsStringSync('content'),
        returnsNormally
      );
    });
    test('.readAsStringSync() should use the original object.', () {
      const String content = 'content';
      expect(
        SilentIoFile(
          LeakedContentIoFile.ignoreOthers(content)
        ).readAsStringSync(),
        same(content)
      );
    });
  });
}
