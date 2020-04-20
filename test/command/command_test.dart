/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/args/ignored_args.dart';
import 'package:dart_style_rin/args/leaked_check_args.dart';
import 'package:dart_style_rin/args/leaked_files_args.dart';
import 'package:dart_style_rin/command/command.dart';
import 'package:dart_style_rin/files/ignored_files.dart';
import 'package:dart_style_rin/files/leaked_check_files.dart';
import 'package:dart_style_rin/files/silent_files.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:test/test.dart';

void main() {
  group('Command', () {
    test('.run() should return exit code from Files.check if --check is true.', () {
      expect(
        Command(
          LeakedCheckArgs(
            LeakedFilesArgs(
              IgnoredArgs(),
              LeakedCheckFiles(
                IgnoredFiles(),
                false
              )
            ),
            true
          ),
          SilentLog()
        ).run(),
        2
      );
    });
    test('.run() should return exit code from Files.format if --check is false.', () {
      expect(
        Command(
          LeakedCheckArgs(
            LeakedFilesArgs(
              IgnoredArgs(),
              SilentFiles()
            ),
            false
          ),
          SilentLog()
        ).run(),
        0
      );
    });
  });
}
