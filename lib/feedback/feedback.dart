/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import '../line/line.dart';
import '../log/log.dart';
import '../rule/rule.dart';

/// Feedback from [Rule].
class Feedback {

  /// Constructor.
  const Feedback(this._line, this._reason, this._log);

  /// Line that triggered the feedback.
  final Line _line;

  /// Reason of the feedback.
  final String _reason;

  /// For logging.
  final Log _log;

  /// Write the feedback on the console.
  void print() {
    _log..debug(this, 'log()', 'Start writing the log.')
      ..info('L${_line.num()}: $_reason')
      ..debug(this, 'log()', 'End writing the log.');
  }

}
