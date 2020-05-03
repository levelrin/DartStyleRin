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

/// It checks if the code contains trailing spaces and remove them.
class NoTrailingSpaces implements Rule {

  /// Constructor.
  const NoTrailingSpaces(this._log);

  /// For logging.
  final Log _log;

  @override
  List<Feedback> check(final Source source) {
    _log.debug(this, 'check()', 'Start checking the trailing spaces.');
    final List<Feedback> feedbackList = <Feedback>[];
    for (final Line line in source.lines()) {
      if (RegExp(r'[ \t]+$').hasMatch(line.text())) {
        feedbackList.add(
          Feedback(
            line,
            'Found trailing spaces.',
            _log
          )
        );
      }
    }
    _log.debug(this, 'check()', 'End checking the trailing spaces.');
    return feedbackList;
  }

  @override
  Source format(final Source source) {
    return Source(
      source.toString().replaceAll(
        RegExp(r'[ \t]+$', multiLine: true),
        ''
      ),
      _log
    );
  }

}
