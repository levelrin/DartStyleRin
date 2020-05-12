/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import '../feedback/feedback.dart';
import '../log/log.dart';
import '../report/report.dart';
import '../rule/rule.dart';
import '../source/source.dart';

/// It represents the collection of formatting [Rule]s.
/// It's responsible for iterating the collection and let [Rule] to apply itself on the [Source].
class Rules {

  /// Constructor.
  const Rules(this._list, this._log);

  /// List of rules.
  final List<Rule> _list;

  /// For logging.
  final Log _log;

  /// Iterate the [Rule]s and let them check the source code.
  /// [source] Target source code.
  Report check(final Source source) {
    _log.debug(this, 'check()', 'Start checking the source.');
    final Report report = Report(_log);
    for (final Rule rule in _list) {
      final List<Feedback> feedbackList = rule.check(source);
      if (feedbackList.isNotEmpty) {
        report.addFeedback(feedbackList);
      }
    }
    _log.debug(this, 'check(Source)', 'End checking the source.');
    return report;
  }

  /// Iterate the [Rule]s and let them format the source code.
  /// It will return the formatted [Source].
  /// [source] Target source code.
  Source format(final Source source) {
    _log.debug(this, 'format()', 'Start formatting the source.');
    Source formattedSource = source;
    for (final Rule rule in _list) {
      formattedSource = rule.format(formattedSource);
    }
    _log.debug(this, 'format(Source)', 'End formatting the source.');
    return formattedSource;
  }

}
