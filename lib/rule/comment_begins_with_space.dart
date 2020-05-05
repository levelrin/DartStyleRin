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

/// Check if a comment begins with a space.
class CommentBeginsWithSpace implements Rule {

  /// Constructor.
  const CommentBeginsWithSpace(this._log);

  /// For logging.
  final Log _log;

  @override
  List<Feedback> check(final Source source) {
    _log.debug(this, 'check()', 'Start checking the comments if they begin with a space.');
    final List<Feedback> feedbackList = <Feedback>[];
    for (final Line line in source.lines()) {
      final String text = line.text();
      final bool hasComment = text.contains(
        RegExp(r'(?<!https?:)\/{2,3}')
      );
      final bool commentStartsWithOneSpace = text.contains(
        RegExp(r'(?<!https?:)\/{2,3} \S')
      );
      final bool emptyComment = text.contains(
        RegExp(r'^\s*\/{2,3}$')
      );
      if (hasComment && !commentStartsWithOneSpace && !emptyComment) {
        feedbackList.add(
          Feedback(line, 'Comments must start with one space.', _log)
        );
      }
    }
    _log.debug(this, 'check()', 'End checking the comments if they begin with a space.');
    return feedbackList;
  }

  @override
  Source format(final Source source) {
    _log.debug(this, 'format()', 'Add a space at the beginning of the comment.');
    return Source(
      source.toString().replaceAll(
        RegExp(r'(?<=(?<!https?:)\/{2,})(?=\S)(?!\/)', multiLine: true),
        ' '
      ),
      _log
    );
  }

}
