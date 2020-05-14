/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'package:dart_style_rin/args/callback_args.dart';
import 'package:dart_style_rin/args/silent_args.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:test/test.dart';

void main() {
  group('CallbackArgs', () {
    test('.check() should execute the callback function.', () {
      bool called = false;
      CallbackArgs(
        SilentArgs(),
        () {
          called = true;
        }
      ).check();
      expect(called, true);
    });
    test('.debug() should execute the callback function.', () {
      bool called = false;
      CallbackArgs(
        SilentArgs(),
        () {
          called = true;
        }
      ).debug();
      expect(called, true);
    });
    test('.files() should execute the callback function.', () {
      bool called = false;
      CallbackArgs(
        SilentArgs(),
        () {
          called = true;
        }
      ).files(
        SilentLog()
      );
      expect(called, true);
    });
  });
}
