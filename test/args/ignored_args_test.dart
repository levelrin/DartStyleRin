/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'package:dart_style_rin/args/ignored_args.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:test/test.dart';

void main() {
  group('IgnoredArgs', () {
    test('.check() should throw an exception.', () {
      expect(
        () => IgnoredArgs().check(),
        throwsUnsupportedError
      );
    });
    test('.debug() should throw an exception.', () {
      expect(
        () => IgnoredArgs().debug(),
        throwsUnsupportedError
      );
    });
    test('.files() should throw an exception.', () {
      expect(
        () => IgnoredArgs().files(
          SilentLog()
        ),
        throwsUnsupportedError
      );
    });
  });
}
