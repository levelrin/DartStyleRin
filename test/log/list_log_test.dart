/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/log/list_log.dart';
import 'package:test/test.dart';

void main() {
  group('ListLog', () {
    test('.debug should not throw an exception.', () {
      expect(
        () => const ListLog(<String>[]).debug(ListLog, 'debug()', 'Apple'),
        returnsNormally
      );
    });
    test('.info() should add the message into the list.', () {
      final List<String> console = <String>[];
      ListLog(console).info('Banana');
      expect(console, <String>['Banana']);
    });
  });
}
