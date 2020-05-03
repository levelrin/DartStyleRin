/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import '../feedback/feedback.dart';
import '../line/line.dart';
import '../log/log.dart';
import '../source/source.dart';
import 'rule.dart';

/// If checks if there are empty lines between import statements and remove them.
/// This rule assumes that empty lines are the only possible things that can exists between import statements.
/// For example, we cannot apply this rule if the code looks like this:
/// ```dart
/// import '../feedback/feedback.dart';
/// // Some comments above the import statement.
/// import '../line/line.dart';
/// import '../log/log.dart';
/// ```
class NoEmptyLinesBetweenImports implements Rule {

  /// Constructor.
  const NoEmptyLinesBetweenImports(this._log);

  /// For logging.
  final Log _log;

  @override
  List<Feedback> check(final Source source) {
    _log.debug(this, 'check()', 'Start checking the empty liens between imports.');
    final List<Feedback> feedbackList = <Feedback>[];
    for (final Line line in _importRange(source)) {
      if (line.text().isEmpty) {
        feedbackList.add(
          Feedback(
            line,
            'Found an empty line between import statements.',
            _log
          )
        );
      }
    }
    _log.debug(this, 'check()', 'End checking the empty liens between imports.');
    return feedbackList;
  }

  @override
  Source format(final Source source) {
    _log.debug(this, 'format()', 'Remove empty lines between import statements.');
    return Source(
      source.toString().replaceAll(
        RegExp(r'(?<=import.*;)\n{2,}(?=import.*;)', multiLine: false),
        '\n'
      ),
      _log
    );
  }

  /// Returns the list of [Line]s from initial to last import statement.
  /// [source] The whole source code.
  List<Line> _importRange(final Source source) {
    _log.debug(this, '_importRange()', 'Start obtaining the import range.');
    final List<Line> lines = <Line>[];
    final List<Line> candidates = <Line>[];
    bool begin = false;
    for (final Line line in source.lines()) {
      final String text = line.text();
      if (text.startsWith('import')) {
        begin = true;
        lines.addAll(candidates);
        candidates.clear();
        lines.add(line);
      } else if (begin && text.isEmpty) {
        candidates.add(line);
      } else if (begin && text.isNotEmpty) {
        break;
      }
    }
    _log.debug(this, '_importRange()', 'End obtaining the import range. range: $lines');
    return lines;
  }

}
