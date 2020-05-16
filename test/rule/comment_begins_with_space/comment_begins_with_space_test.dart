/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'dart:io' as io;
import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/rule/comment_begins_with_space.dart';
import 'package:dart_style_rin/source/source.dart';
import 'package:test/test.dart';

void main() {

  /// Invalid content.
  String invalid;

  setUpAll(() {
    invalid = io.File('test/rule/comment_begins_with_space/invalid.txt').readAsStringSync();
  });

  group('CommentBeginsWithSpace', () {
    test('.check() should give feedback if the comments do not start with a space.', () {
      final SilentLog log = SilentLog();
      expect(
        CommentBeginsWithSpace(log).check(
          Source(invalid, log)
        ).length,
        greaterThan(0)
      );
    });
    test('.check() should not give feedback if the comments start with a space.', () {
      final SilentLog log = SilentLog();
      expect(
        CommentBeginsWithSpace(log).check(
          Source(_valid, log)
        ).length,
        0
      );
    });
    test('.format() should add a space at the beginning of the comments.', () {
      final SilentLog log = SilentLog();
      expect(
        CommentBeginsWithSpace(log).format(
          Source(invalid, log)
        ),
        Source(_valid, log)
      );
    });
  });
}

const String _valid = '''
// Apple
///
/// Banana
Orange // Kiwi
    /// Cat
    ///
    // Dog
    Bird // Fish
/// https://www.levelrin.com
/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
/// ```dart
/// if (1 == 1) {
///   print('Do something.');
/// } // <- Let's say this is the value of the text.
/// ```
''';
