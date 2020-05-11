/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'dart:io' as io;
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/rule/indentation.dart';
import 'package:dart_style_rin/source/source.dart';
import 'package:test/test.dart';

void main() {

  /// Invalid content.
  String invalid;

  setUpAll(() {
    invalid = io.File('test/rule/indentation/invalid.txt').readAsStringSync();
  });

  group('Indentation', () {
    test('.check() should give feedback if the indentation is wrong.', () {
      final SilentLog log = SilentLog();
      expect(
        Indentation(log).check(
          Source(invalid, log)
        ).length,
        greaterThan(0)
      );
    });
    test('.check() should not give feedback if the indentation is correct.', () {
      final SilentLog log = SilentLog();
      expect(
        Indentation(log).check(
          Source(_valid, log)
        ).length,
        0
      );
    });
    test('.format() should indent the code.', () {
      final SilentLog log = SilentLog();
      expect(
        Indentation(log).format(
          Source(invalid, log)
        ),
        Source(_valid, log)
      );
    });
  });
}

const String _valid = '''
class Type {

  int _field1;

  int _field2;

  void method1(Param param1, Param param2) {
    param1.method1(
      'A'.toLowerCase(),
      'b'.toUpperCase(),
      3.toString()
    );
    param2.method2(
      <String>[
        'Apple',
        'Banana',
        'Orange'
      ]
    );
  }

  void method2(Param param1, Param param2) {
    test('yoi', () {
      param1.one();
    });
    test('yoi2', () {
      // uno
    }, skip: param1.two());
    if (param2.one()) {
      // one
    } else if (param3.two()) {
      // two
    } else {
      // three
    }
  }

}
''';
