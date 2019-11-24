/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import '../args/args.dart';
import '../files/files.dart';
import '../log/log.dart';

/// Top layer of program.
/// We will use this in the main function.
/// It's responsible for taking the user input and let [Files] to format themselves.
class Command {

  /// Constructor.
  const Command(this._args, this._log);

  /// Command line arguments from the user.
  final Args _args;

  /// For writing log.
  final Log _log;

  /// Run the formatting command.
  /// It returns the exit code to tell us the result of command.
  /// 0 means success.
  /// 1 means warnings.
  /// 2 means errors.
  int run() {
    _log.debug(this, 'run()', 'Start running command.');
    int exitCode;
    if (_args.check()) {
      exitCode = _args.files(_log).check();
    } else {
      exitCode = _args.files(_log).format();
    }
    _log.debug(this, 'run()', 'End command. exitCode: $exitCode');
    return exitCode;
  }

}
