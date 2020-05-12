/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import '../feedback/feedback.dart';
import '../line/line.dart';
import '../log/log.dart';
import '../source/source.dart';
import 'rule.dart';

/// Check if the file ends with an empty line and add a new line.
class EmptyLineAtEnd implements Rule {

  /// Constructor.
  const EmptyLineAtEnd(this._log);

  /// For logging.
  final Log _log;

  @override
  List<Feedback> check(final Source source) {
    _log.debug(this, 'check()', 'Start checking the empty line at the end.');
    final List<Feedback> feedbackList = <Feedback>[];
    final Line last = source.lines().last;
    if (last.text().isNotEmpty) {
      feedbackList.add(
        Feedback(last, 'The file does not end with the empty line.', _log)
      );
    }
    _log.debug(this, 'check()', 'End checking the empty line at the end.');
    return feedbackList;
  }

  @override
  Source format(final Source source) {
    _log.debug(this, 'format()', 'Start adding a new line at the end of the file.');
    Source result;
    if (source.toString().endsWith('\n')) {
      result = source;
    } else {
      result = Source(
        '${source.toString()}\n',
        _log
      );
    }
    _log.debug(this, 'format()', 'End adding a new line at the end of the file.');
    return result;
  }

}
