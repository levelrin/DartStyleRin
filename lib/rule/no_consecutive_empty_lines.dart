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

/// It checks if the code contains consecutive empty lines and remove them.
class NoConsecutiveEmptyLines implements Rule {

  /// Constructor.
  const NoConsecutiveEmptyLines(this._log);

  /// For logging.
  final Log _log;

  @override
  List<Feedback> check(final Source source) {
    _log.debug(this, 'check()', 'Start checking the consecutive line breaks.');
    final List<Feedback> feedbackList = <Feedback>[];
    String previous = '';
    for (final Line line in source.lines()) {
      final String current = line.text();
      if (current.isEmpty && previous.isEmpty) {
        feedbackList.add(
          Feedback(
            line,
            'Found a consecutive line break.',
            _log
          )
        );
      }
      previous = current;
    }
    _log.debug(this, 'check()', 'End checking the consecutive line breaks.');
    return feedbackList;
  }

  @override
  Source format(final Source source) {
    _log.debug(this, 'format()', 'Remove consecutive line breaks.');
    return Source(
      source.toString().replaceAll(
        RegExp(r'[\r\n]{3,}', multiLine: false),
        '\n\n'
      ),
      _log
    );
  }

}
