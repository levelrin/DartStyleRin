/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import '../feedback/feedback.dart';
import '../line/line.dart';
import '../log/log.dart';
import '../source/source.dart';
import 'rule.dart';

/// It checks if the for loop has spaces in a correct way.
class SpacesInFor implements Rule {

  /// Constructor.
  const SpacesInFor(this._log);

  /// For logging.
  final Log _log;

  @override
  List<Feedback> check(final Source source) {
    _log.debug(this, 'check()', 'Start checking the spaces of for loop.');
    final List<Feedback> feedbackList = <Feedback>[];
    for (final Line line in source.lines()) {
      final String text = line.text();
      if (_isForLoop(text) && !_hasSpacesCorrectly(text)) {
        feedbackList.add(
          Feedback(
            line,
            'The for loop has incorrect number of spaces.',
            _log
          )
        );
      }
    }
    _log.debug(this, 'check()', 'End checking the spaces of for loop.');
    return feedbackList;
  }

  @override
  Source format(final Source source) {
    _log.debug(this, 'format()', 'Put the correct number of spaces into the for loop.');
    return Source(
      source.toString().replaceAll(
        RegExp(r'(?<=^\s*for)\s*(?=[(].*[)]\s*{)', multiLine: true), ' '
      ).replaceAll(
        RegExp(r'(?<=^\s*for\s*[(].*[)])\s*(?={)', multiLine: true), ' '
      ),
      _log
    );
  }

  /// Check if the [text] is a for loop.
  /// [text] A particular line of code.
  bool _isForLoop(final String text) {
    _log.debug(this, '_isForLoop()', 'Check if the line is a for loop. text: $text');
    return text.contains(
      RegExp(
        r'^\s*for\s*[(].*[)]\s*{'
      )
    );
  }

  /// Assuming that the [text] is a for loop.
  /// It checks if the [text] has spaces correctly.
  /// [text] A particular line of code.
  bool _hasSpacesCorrectly(final String text) {
    _log.debug(
      this,
      '_hasSpacesCorrectly()',
      'Check if the for loop has spaces correctly. text: $text'
    );
    return text.contains(
      RegExp(
        r'^\s*for\s{1,1}[(].*[)]\s{1,1}{'
      )
    );
  }

}
