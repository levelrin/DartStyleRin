/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import '../log/log.dart';
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

  /// Check the source code whether it is formatted correctly or not.
  /// It will iterate the list of [Rule]s and return the exit code.
  /// 0 means the source code is correctly formatted.
  /// 2 means the source code is not corrected formatted.
  /// [source] Target source code.
  int check(final Source source) {
    _log.debug(this, 'check()', 'Start checking the source.');
    final List<int> exitCodes = <int>[];
    for (final Rule rule in _list) {
      exitCodes.add(
        rule.check(source)
      );
    }
    _log.debug(this, 'check(Source)', 'End checking the source.');
    return _exitCode(exitCodes);
  }

  /// Format the source code.
  /// It will iterate the list of [Rule]s and return the exit code.
  /// 0 means success.
  /// 2 means errors.
  /// It performs the formatting only if the source was not formatted correctly.
  /// [source] Target source code.
  int format(final Source source) {
    _log.debug(this, 'format()', 'Start formatting the source.');
    final List<int> exitCodes = <int>[];
    for (final Rule rule in _list) {
      if (rule.check(source) != 0) {
        exitCodes.add(
          rule.format(source)
        );
      }
    }
    int exitCode = 0;
    if (exitCodes.isNotEmpty) {
      exitCode = _exitCode(exitCodes);
    }
    _log.debug(this, 'format(Source)', 'End formatting the source.');
    return exitCode;
  }

  /// Return exit code after the iteration of [Rule]s.
  int _exitCode(final List<int> exitCodes) {
    _log.debug(this, '_exitCode()', 'Start getting the exit code.');
    int exitCode = 0;
    if (exitCodes.contains(2)) {
      exitCode = 2;
    }
    _log.debug(this, '_exitCode()', 'End getting the exit code. code: $exitCode');
    return exitCode;
  }

}
