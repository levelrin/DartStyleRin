/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/line/line.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/source/source.dart';
import 'package:test/test.dart';

void main() {
  group('Source', () {
    test('.lines() should be created by splitting the raw String by line breaks.', () {
      final SilentLog log = SilentLog();
      expect(
        Source(
          _raw,
          log
        ).lines(),
        <Line>[
          Line('one two', 1, log),
          Line('', 2, log),
          Line('three', 3, log),
          Line('four', 4, log),
          Line('', 5, log),
          Line('', 6, log)
        ]
      );
    });
    test('.toString() should return the raw text.', () {
      expect(
        Source(
          'Apple\nBanana\nOrange',
          SilentLog()
        ).toString(),
        'Apple\nBanana\nOrange'
      );
    });
    test('== should return true if the source code of comparing object is the same.', () {
      final SilentLog log = SilentLog();
      final Source source1 = Source(_raw, log);
      final Source source2 = Source(_raw, log);
      final bool same = source1 == source2;
      expect(same, true);
    });
    test('== should return true if the source code of comparing object is different.', () {
      final SilentLog log = SilentLog();
      final Source source1 = Source(_raw, log);
      final Source source2 = Source('123 $_raw', log);
      final bool same = source1 == source2;
      expect(same, false);
    });
    test('.hashCode should return the same int as comparing object if it is equal to comparing one', () {
      final SilentLog log = SilentLog();
      final Source source1 = Source(_raw, log);
      final Source source2 = Source(_raw, log);
      expect(source1.hashCode, source2.hashCode);
    });
  });
}

const String _raw = '''
one two

three
four

''';
