/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/io/stdout/list_stdout.dart';
import 'package:test/test.dart';

void main() {
  group('ListStdout', () {
    test('.writeln() should add a message to the list.', () {
      final List<String> record = <String>[];
      ListStdout(record).writeln('Apple');
      expect(record, <String>['Apple']);
    });
    test('Other methods should throw an exception.', () {
      expect(
        () => const ListStdout(<String>[]).write('Apple'),
        throwsUnsupportedError
      );
    });
  });
}
