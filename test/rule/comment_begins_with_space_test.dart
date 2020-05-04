/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/log/silent_log.dart';
import 'package:dart_style_rin/rule/comment_begins_with_space.dart';
import 'package:dart_style_rin/source/source.dart';
import 'package:test/test.dart';

void main() {
  group('CommentBeginsWithSpace', () {
    test('.check() should give feedback if the comments do not start with a space.', () {
      final SilentLog log = SilentLog();
      expect(
        CommentBeginsWithSpace(log).check(
          Source(_invalid(), log)
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
          Source(_invalid(), log)
        ),
        Source(_valid, log)
      );
    });
  });
}

/// Remove the spaces at the beginning of the comments.
String _invalid() {
  return _valid.replaceAll(
    RegExp(r'(?<=\/{2,3}) ', multiLine: true),
    ''
  );
}

const String _valid = '''
// Apple
/// Banana
Orange // Kiwi
    /// Cat
    // Dog
    Bird // Fish
/// https://www.levelrin.com
/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */
''';
