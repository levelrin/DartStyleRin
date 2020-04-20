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

/// It checks if the code contains empty indentations and remove them.
class NoEmptyIndentation implements Rule {

  /// Constructor.
  const NoEmptyIndentation(this._log);

  /// For logging.
  final Log _log;

  @override
  List<Feedback> check(final Source source) {
    _log.debug(this, 'check()', 'Start checking the empty indentation.');
    final List<Feedback> feedbackList = <Feedback>[];
    for (final Line line in source.lines()) {
      final RegExp regex = RegExp(r'^\s+$');
      final String text = line.text();
      if (regex.hasMatch(text)) {
        feedbackList.add(
          Feedback(
            line,
            'Found an empty indentation.',
            _log
          )
        );
      }
    }
    _log.debug(this, 'check()', 'End checking the empty indentation.');
    return feedbackList;
  }

  @override
  Source format(final Source source) {
    _log.debug(this, 'format()', 'Remove empty indentation.');
    return Source(
      source.toString().replaceAll(
        RegExp(r'^\s+$', multiLine: true),
        ''
      ),
      _log
    );
  }

}
