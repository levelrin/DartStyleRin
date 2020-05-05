/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:meta/meta.dart';
import 'package:quiver/core.dart' as quiver;
import '../log/log.dart';
import '../rule/rule.dart';

/// Represents a line of the source code.
/// It's responsible for providing the information of the line for [Rule].
@immutable
class Line {

  /// Constructor.
  const Line(this._text, this._num, this._log);

  /// See [text].
  final String _text;

  /// See [num].
  final int _num;

  /// For logging.
  final Log _log;

  /// Text of the line.
  String text() {
    _log.debug(this, 'text()', 'Return text: $_text');
    return _text;
  }

  /// Line number.
  /// The value of first line should be 1.
  int num() {
    _log.debug(this, 'num()', 'Return line number: $_num');
    return _num;
  }

  @override
  String toString() {
    final String description = 'L$_num: $_text';
    _log.debug(this, 'toString()', 'Description: $description');
    return description;
  }

  @override
  bool operator ==(final Object other) {
    final bool same = other is Line && other._text == _text && other._num == _num;
    _log.debug(this, '==', 'Compare ${toString()} and ${other.toString()}. equality: $same');
    return same;
  }

  @override
  int get hashCode {
    final int code = quiver.hash2(_text, _num);
    _log.debug(this, 'hashCode', 'hashCode: $code');
    return code;
  }

}
