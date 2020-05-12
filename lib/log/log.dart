/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'dart:io';
import '../args/args.dart';

/// It's responsible for writing log.
class Log {

  /// Constructor.
  const Log(this._args, this._console);

  /// Command line arguments from the user.
  /// We are interested in --debug flag.
  final Args _args;

  /// The object that actually print something to the console.
  final Stdout _console;

  /// We will print the [message] on the console regardless of the --debug flag.
  /// [message] Information to show on the console.
  void info(final String message) {
    _console.writeln(message);
  }

  /// It's for the bug report.
  /// We will print the [message] on the console if --debug flag is true.
  /// [caller] The object that uses this.
  /// [method] The method name that uses this.
  /// [message] Information for reporting the bug.
  void debug(final Object caller, final String method, final String message) {
    if (_args.debug()) {
      _console.writeln('${caller.runtimeType}.$method: $message');
    }
  }

}
