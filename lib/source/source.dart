/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:meta/meta.dart';
import 'package:quiver/core.dart' as quiver;
import '../line/line.dart';
import '../log/log.dart';

/// It represents the source code of Dart file.
/// It's responsible for providing the information so we can format it easily.
/// [toString] should return the raw String.
@immutable
class Source {

  /// Constructor.
  const Source(this._raw, this._log);

  /// Raw source code.
  final String _raw;

  /// For logging.
  final Log _log;

  /// Parse the raw source code and return the list of [Line]s.
  List<Line> lines() {
    _log.debug(this, 'lines()', 'Start splitting the text by line breaks.');
    final List<Line> lines = <Line>[];
    final List<String> rawLines = _raw.split('\n');
    for (int x = 0; x < rawLines.length; x++) {
      lines.add(
        Line(rawLines[x], x + 1, _log)
      );
    }
    _log.debug(this, 'lines()', 'End splitting the text by line breaks.');
    return lines;
  }

  @override
  String toString() {
    _log.debug(this, 'toString()', 'Return raw text: $_raw');
    return _raw;
  }

  @override
  bool operator ==(final Object other) {
    final bool same = other is Source && other._raw == _raw;
    _log.debug(this, '==', 'Compare ${toString()} and ${other.toString()}. equality: $same');
    return same;
  }

  @override
  int get hashCode {
    final int code = quiver.hash2(_raw, _raw.length);
    _log.debug(this, 'hashCode', 'hashCode: $code');
    return code;
  }

}
