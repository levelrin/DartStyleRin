/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'log.dart';

/// It's for testing.
/// You can inject a [List], and it will write the message into the list.
/// It will do nothing for [debug] logging.
class ListLog implements Log {

  /// Primary constructor.
  const ListLog(this._console);

  /// We pretend it's a console.
  final List<String> _console;

  @override
  void debug(final Object caller, final String method, final String message) {
    // Do nothing.
  }

  @override
  void info(final String message) {
    _console.add(message);
  }

}
