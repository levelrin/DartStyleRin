/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'package:dart_style_rin/args/cached_args.dart';
import 'package:dart_style_rin/args/callback_args.dart';
import 'package:dart_style_rin/args/silent_args.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:test/test.dart';

void main() {
  group('CachedArgs', () {
    test('.check() should cache its value.', () {
      int counter = 0;
      CachedArgs(
        CallbackArgs(
          SilentArgs(),
          () {
            counter++;
          }
        )
      )..check()..check();
      expect(counter, 1);
    });
    test('.debug() should cache its value.', () {
      int counter = 0;
      CachedArgs(
        CallbackArgs(
          SilentArgs(),
          () {
            counter++;
          }
        )
      )..debug()..debug();
      expect(counter, 1);
    });
    test('.files() should cache its value.', () {
      int counter = 0;
      CachedArgs(
        CallbackArgs(
          SilentArgs(),
          () {
            counter++;
          }
        )
      )..files(
        SilentLog()
      )..files(
        SilentLog()
      );
      expect(counter, 1);
    });
  });
}
