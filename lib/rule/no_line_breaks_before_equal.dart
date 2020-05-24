/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import '../feedback/feedback.dart';
import '../line/line.dart';
import '../log/log.dart';
import '../source/source.dart';
import 'rule.dart';

/// It checks the code it there are some line breaks before the equal (=) sign.
/// For example,
/// ```dart
/// final String one
/// = 'one';
/// ```
/// The above should be:
/// ```dart
/// final String one = 'one';
/// ```
class NoLineBreaksBeforeEqual implements Rule {

  /// Constructor.
  const NoLineBreaksBeforeEqual(this._log);

  /// For logging.
  final Log _log;

  @override
  List<Feedback> check(final Source source) {
    _log.debug(this, 'check()', 'Start checking the line breaks before the equal sign.');
    final List<Feedback> feedbackList = <Feedback>[];
    for (final Line line in source.lines()) {
      final String text = line.text();
      if (text.trimLeft().startsWith('=')) {
        feedbackList.add(
          Feedback(
            line,
            'Line breaks are not allowed before the equal sign.',
            _log
          )
        );
      }
    }
    _log.debug(this, 'check()', 'End checking the line breaks before the equal sign.');
    return feedbackList;
  }

  @override
  Source format(final Source source) {
    return Source(
      source.toString().replaceAll(
        RegExp(r'\n\s*=', multiLine: false),
        ' ='
      ),
      _log
    );
  }

}
