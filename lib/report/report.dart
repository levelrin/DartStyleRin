/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import '../feedback/feedback.dart';
import '../file/file.dart';
import '../log/log.dart';
import '../rule/rule.dart';
import '../rules/rules.dart';

/// Report from [Rules.check].
class Report {

  /// Constructor.
  Report(this._log);

  /// For logging.
  final Log _log;

  /// Aggregation of all feedback from [Rules.check].
  final List<List<Feedback>> _allFeedback = <List<Feedback>>[];

  /// Add a list of feedback from [Rule.check].
  void addFeedback(List<Feedback> feedbackList) {
    _log.debug(this, 'addFeedback()', 'Start adding feedback.');
    _allFeedback.add(feedbackList);
    _log.debug(this, 'addFeedback()', 'End adding feedback.');
  }

  /// Write all the feedback on the console.
  void print() {
    _log.debug(this, 'print()', 'Start printing all feedback on the console.');
    for (final List<Feedback> feedbackList in _allFeedback) {
      for (final Feedback feedback in feedbackList) {
        feedback.print();
      }
    }
    _log.debug(this, 'print()', 'End printing all feedback on the console.');
  }

  /// Whether the [File] is formatted correctly or not.
  /// True means [Rules] could not find any issue.
  /// False means [Rules] found some issues.
  bool pass() {
    _log.debug(this, 'pass()', 'See if all feedback is empty: ${_allFeedback.isEmpty}');
    return _allFeedback.isEmpty;
  }

}
