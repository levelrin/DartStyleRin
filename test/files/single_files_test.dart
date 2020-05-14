/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'dart:io' as io;
import 'package:dart_style_rin/files/silent_files.dart';
import 'package:dart_style_rin/files/single_files.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:test/test.dart';

void main() {
  group('SingleFiles', () {
    test('.check() should instantiate Files object with the directory of a single file.', () {
      io.Directory oneFileDir;
      SingleFiles(
        'apple.dart',
        (io.Directory dir) {
          oneFileDir = dir;
          return SilentFiles();
        },
        SilentLog()
      ).check();
      expect(oneFileDir.listSync().length, 1);
    });
    test('.format() should instantiate Files object with the directory of a single file.', () {
      io.Directory oneFileDir;
      SingleFiles(
        'apple.dart',
        (io.Directory dir) {
          oneFileDir = dir;
          return SilentFiles();
        },
        SilentLog()
      ).format();
      expect(oneFileDir.listSync().length, 1);
    });
  });
}
