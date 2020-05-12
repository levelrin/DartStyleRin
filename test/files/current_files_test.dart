/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'dart:io' as io;
import 'package:dart_style_rin/files/current_files.dart';
import 'package:dart_style_rin/files/silent_files.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:test/test.dart';

void main() {
  group('CurrentFiles', () {
    test('.check() should instantiate the Files object with current directory.', () {
      io.Directory dir;
      CurrentFiles(
        (io.Directory currentDir) {
          dir = currentDir;
          return SilentFiles();
        },
        SilentLog()
      ).check();
      expect(dir.path, io.Directory.current.path);
    });
    test('.format() should instantiate the Files object with current directory.', () {
      io.Directory dir;
      CurrentFiles(
        (io.Directory currentDir) {
          dir = currentDir;
          return SilentFiles();
        },
        SilentLog()
      ).format();
      expect(dir.path, io.Directory.current.path);
    });
  });
}
