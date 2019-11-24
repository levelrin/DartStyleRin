/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/args/args.dart';
import 'package:dart_style_rin/files/current_files.dart';
import 'package:dart_style_rin/files/files.dart';
import 'package:dart_style_rin/files/single_files.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:test/test.dart';

void main() {
  group('Args', () {
    test('.check() should check if --check flag is true.', () {
      expect(
        const Args(
          <String>['--check']
        ).check(),
        true
      );
      expect(
        const Args(
          <String>['']
        ).check(),
        false
      );
      expect(
        const Args(
          <String>[]
        ).check(),
        false
      );
    });
    test('.debug() should check if --debug flag is true.', () {
      expect(
        const Args(
          <String>['--debug']
        ).debug(),
        true
      );
      expect(
        const Args(
          <String>['']
        ).debug(),
        false
      );
      expect(
        const Args(
          <String>[]
        ).debug(),
        false
      );
    });
    test('.files() should return CurrentFiles if the user does not provide path.', () {
      expect(
        const Args(
          <String>[]
        ).files(
          SilentLog()
        ),
        isA<CurrentFiles>()
      );
      expect(
        const Args(
          <String>['']
        ).files(
          SilentLog()
        ),
        isA<CurrentFiles>()
      );
    });
    test('.files() should return SingleFiles if the user wants to format a single file.', () {
      expect(
        const Args(
          <String>['apple.dart']
        ).files(
          SilentLog()
        ),
        isA<SingleFiles>()
      );
    });
    test('.files() should return Files if the user wants to format files under the specified directory.', () {
      expect(
        const Args(
          <String>['test']
        ).files(
          SilentLog()
        ),
        isA<Files>()
      );
    });
  });
}
