/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'package:dart_style_rin/args/ignored_args.dart';
import 'package:dart_style_rin/args/leaked_files_args.dart';
import 'package:dart_style_rin/files/ignored_files.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:test/test.dart';

void main() {
  group('LeakedFilesArgs', () {
    test('.check() should use the original object.', () {
      expect(
        () => LeakedFilesArgs(
          IgnoredArgs(),
          IgnoredFiles()
        ).check(),
        throwsUnsupportedError
      );
    });
    test('.debug() should use the original object.', () {
      expect(
        () => LeakedFilesArgs(
          IgnoredArgs(),
          IgnoredFiles()
        ).debug(),
        throwsUnsupportedError
      );
    });
    test('.files() should return the injected object.', () {
      expect(
        LeakedFilesArgs(
          IgnoredArgs(),
          IgnoredFiles()
        ).files(
          SilentLog()
        ),
        isA<IgnoredFiles>()
      );
    });
  });
}
