/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import '../feedback/feedback.dart';
import '../line/line.dart';
import '../log/log.dart';
import '../source/source.dart';
import 'rule.dart';

/// It checks if the if-statements have spaces in a correct way.
class SpacesInIf implements Rule {

  /// Constructor.
  const SpacesInIf(this._log);

  /// For logging.
  final Log _log;

  @override
  List<Feedback> check(final Source source) {
    _log.debug(this, 'check()', 'Start checking the spaces of if statements.');
    final List<Feedback> feedbackList = <Feedback>[];
    for (final Line line in source.lines()) {
      final String text = line.text();
      if (_isIfStatement(text) && !_hasSpacesCorrectly(text)) {
        feedbackList.add(
          Feedback(
            line,
            'The if statement has incorrect number of spaces.',
            _log
          )
        );
      }
    }
    _log.debug(this, 'check()', 'End checking the spaces of if statements.');
    return feedbackList;
  }

  @override
  Source format(final Source source) {
    _log.debug(this, 'format()', 'Put the correct number of spaces into the if statements.');
    return Source(
      source.toString().replaceAll(
        RegExp(r'(?<=if)\s*(?=[(].*[)]\s*{)', multiLine: true), ' '
      ).replaceAll(
        RegExp(r'(?<=if\s*[(].*[)])\s*(?={)', multiLine: true), ' '
      ).replaceAll(
        RegExp(r'(?<=})\s*(?=else\s+if\s*[(].*[)]\s*{)', multiLine: true), ' '
      ).replaceAll(
        RegExp(r'(?<=}\s*else)\s*(?=if\s*[(].*[)]\s*{)', multiLine: true), ' '
      ).replaceAll(
        RegExp(r'(?<=}\s*else\s*if)\s*(?=[(].*[)]\s*{)', multiLine: true), ' '
      ).replaceAll(
        RegExp(r'(?<=}\s*else\s*if\s*[(].*[)])\s*(?={)', multiLine: true), ' '
      ).replaceAll(
        RegExp(r'(?<=})\s*(?=else\s*{)', multiLine: true), ' '
      ).replaceAll(
        RegExp(r'(?<=}\s*else)\s*(?={)', multiLine: true), ' '
      ),
      _log
    );
  }

  /// Check if the [text] is a if statement.
  /// Basically, it's looking the if, else if, or else line.
  /// [text] A particular line of code.
  bool _isIfStatement(final String text) {
    _log.debug(this, '_isIfStatement()', 'Check if the line is a if statement. text: $text');
    return text.contains(
      RegExp(
        r'^if\s*[(].*[)]\s*{|}\s*else\s+if\s*[(].*[)]\s*{|}\s*else\s*{'
      )
    );
  }

  /// Assuming that the [text] is a if statement.
  /// It checks if the [text] has spaces correctly.
  /// [text] A particular line of code.
  bool _hasSpacesCorrectly(final String text) {
    _log.debug(
      this,
      '_hasSpacesCorrectly()',
      'Check if the if-statement has spaces correctly. text: $text'
    );
    return text.contains(
      RegExp(
        r'^if\s{1,1}[(].*[)]\s{1,1}{|}\s{1,1}else\s{1,1}if\s{1,1}[(].*[)]\s{1,1}{|}\s{1,1}else\s{1,1}{'
      )
    );
  }

}
