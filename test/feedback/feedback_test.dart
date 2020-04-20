/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/feedback/feedback.dart';
import 'package:dart_style_rin/line/line.dart';
import 'package:dart_style_rin/log/list_log.dart';
import 'package:test/test.dart';

void main() {
  group('Feedback', () {
    test('.print() should write the feedback on the console.', () {
      final List<String> console = <String>[];
      final ListLog log = ListLog(console);
      Feedback(
        Line('Apple', 1, log),
        'Banana',
        log
      ).print();
      expect(
        console,
        <String>['L1: Banana']
      );
    });
  });
}
