/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'dart:io' as io;
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/rule/spaces_in_switch.dart';
import 'package:dart_style_rin/source/source.dart';
import 'package:test/test.dart';

void main() {

  /// Invalid content.
  String invalid;

  /// Valid content.
  String valid;

  setUpAll(() {
    invalid = io.File('test/rule/spaces_in_switch/invalid.txt').readAsStringSync();
    valid = io.File('test/rule/spaces_in_switch/valid.txt').readAsStringSync();
  });

  group('SpacesInSwitch', () {
    test('.check() should give feedback if the switch statement has incorrect number of spaces.', () {
      final SilentLog log = SilentLog();
      expect(
        SpacesInSwitch(log).check(
          Source(invalid, log)
        ).length,
        greaterThan(0)
      );
    });
    test('.check() should not give feedback if the switch statement has correct number of spaces.', () {
      final SilentLog log = SilentLog();
      expect(
        SpacesInSwitch(log).check(
          Source(valid, log)
        ).length,
        0
      );
    });
    test('.format() should put spaces into the switch statements in a correct way.', () {
      final SilentLog log = SilentLog();
      expect(
        SpacesInSwitch(log).format(
          Source(invalid, log)
        ),
        Source(valid, log)
      );
    });
  });

}
