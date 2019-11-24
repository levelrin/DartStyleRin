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
import 'package:dart_style_rin/files/leaked_code_files.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:test/test.dart';

void main() {
  group('Command', () {
    test('.run() should exit code from Files.check if --check if true.', () {
      expect(
        Command(
          LeakedCheckArgs(
            LeakedFilesArgs(
              IgnoredArgs(),
              LeakedCodeFiles(0, 2)
            ),
            true
          ),
          SilentLog()
        ).run(),
        0
      );
    });
    test('.run() should exit code from Files.format if --check if false.', () {
      expect(
        Command(
          LeakedCheckArgs(
            LeakedFilesArgs(
              IgnoredArgs(),
              LeakedCodeFiles(0, 2)
            ),
            false
          ),
          SilentLog()
        ).run(),
        2
      );
    });
  });
}
