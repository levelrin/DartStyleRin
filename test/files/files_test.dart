/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'dart:io' as io;
import 'package:dart_style_rin/file/file.dart';
import 'package:dart_style_rin/file/ignored_file.dart';
import 'package:dart_style_rin/file/leaked_check_file.dart';
import 'package:dart_style_rin/file/silent_file.dart';
import 'package:dart_style_rin/files/files.dart';
import 'package:dart_style_rin/io/directory/leaked_entities_dir.dart';
import 'package:dart_style_rin/io/directory/silent_dir.dart';
import 'package:dart_style_rin/io/file/leaked_path_io_file.dart';
import 'package:dart_style_rin/log/log.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:test/test.dart';

void main() {
  group('Files', () {
    test('.check() should only check Dart files.', () {
      int checkAmount = 0;
      Files(
        LeakedEntitiesDir(
          <io.File>[
            const LeakedPathIoFile('apple.dart'),
            const LeakedPathIoFile('banana.txt')
          ]
        ),
        (io.File ioFile, Log log) {
          checkAmount++;
          return SilentFile();
        },
        SilentLog()
      ).check();
      expect(checkAmount, 1);
    });
    test('.format() should only format Dart files.', () {
      int formatAmount = 0;
      Files(
        LeakedEntitiesDir(
          <io.File>[
            const LeakedPathIoFile('apple.dart'),
            const LeakedPathIoFile('banana.txt')
          ]
        ),
        (io.File ioFile, Log log) {
          formatAmount++;
          return SilentFile();
        },
        SilentLog()
      ).format();
      expect(formatAmount, 1);
    });
    test('.check() should return 2 if there is a file that is not correctly formatted.', () {
      int fileNum = 0;
      expect(
        Files(
          LeakedEntitiesDir(
            <io.File>[
              const LeakedPathIoFile('apple.dart'),
              const LeakedPathIoFile('banana.dart')
            ]
          ),
            (io.File ioFile, Log log) {
            File file;
            if (fileNum == 0) {
              file = LeakedCheckFile(
                IgnoredFile(),
                true
              );
              fileNum++;
            } else {
              file = LeakedCheckFile(
                IgnoredFile(),
                false
              );
            }
            return file;
          },
          SilentLog()
        ).check(),
        false
      );
    });
    test('.check() should not throw an exception if the directory contains subdirectory.', () {
      expect(
        () => Files(
          LeakedEntitiesDir(
            <io.FileSystemEntity>[
              SilentDir()
            ]
          ),
          (io.File ioFile, Log log) {
            return SilentFile();
          },
          SilentLog()
        ).check(),
        returnsNormally
      );
    });
    test('.format() should not throw an exception if the directory contains subdirectory.', () {
      expect(
          () => Files(
          LeakedEntitiesDir(
            <io.FileSystemEntity>[
              SilentDir()
            ]
          ),
          (io.File ioFile, Log log) {
            return SilentFile();
          },
          SilentLog()
        ).format(),
        returnsNormally
      );
    });
  });
}
