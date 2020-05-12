/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'package:dart_style_rin/line/line.dart';
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:test/test.dart';

void main() {
  group('Line', () {
    test('.text() should return the text of line.', () {
      expect(
        Line(
          'Apple',
          1,
          SilentLog()
        ).text(),
        'Apple'
      );
    });
    test('.num() should return the line number.', () {
      expect(
        Line(
          'Banana',
          2,
          SilentLog()
        ).num(),
        2
      );
    });
    test('.toString() should include the line number and the text.', () {
      expect(
        Line(
          'Orange',
          3,
          SilentLog()
        ).toString(),
        'L3: Orange'
      );
    });
    test('== should return true if the text and line number of comparing object are the same.', () {
      final SilentLog log = SilentLog();
      final Line line1 = Line('Apple', 1, log);
      final Line line2 = Line('Apple', 1, log);
      final bool same = line1 == line2;
      expect(same, true);
    });
    test('== should return false if the text or line number of comparing object is different.', () {
      final SilentLog log = SilentLog();
      final Line line1 = Line('Apple', 1, log);
      final Line line2 = Line('Apple', 2, log);
      final bool same = line1 == line2;
      expect(same, false);
    });
    test('.hashCode should return the same int as comparing object if it is equal to comparing one', () {
      final SilentLog log = SilentLog();
      final Line line1 = Line('Apple', 1, log);
      final Line line2 = Line('Apple', 1, log);
      expect(line1.hashCode, line2.hashCode);
    });
  });
}
