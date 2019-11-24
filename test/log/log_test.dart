/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/args/args.dart';
import 'package:dart_style_rin/args/silent_args.dart';
import 'package:dart_style_rin/io/stdout/list_stdout.dart';
import 'package:dart_style_rin/log/log.dart';
import 'package:test/test.dart';

void main() {
  group('Log', () {
    test('.info() should print the message on the console.', () {
      final List<String> record = <String>[];
      Log(
        SilentArgs(),
        ListStdout(record)
      ).info('one');
      expect(record, contains('one'));
    });
    test('.debug() should print the message if --debug flag is true.', () {
      final List<String> record = <String>[];
      Log(
        const Args(
          <String>['--debug']
        ),
        ListStdout(record)
      ).debug('caller', 'test', 'two');
      expect(record.first, 'String.test: two');
    });
    test('.debug() should not print the message if --debug flag is false.', () {
      final List<String> record = <String>[];
      Log(
        const Args(
          <String>[]
        ),
        ListStdout(record)
      ).debug('caller', 'test', 'two');
      expect(record, isEmpty);
    });
  });
}
