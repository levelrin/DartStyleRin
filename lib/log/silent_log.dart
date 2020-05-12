/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'log.dart';

/// It's for testing.
/// You can use this when you don't care about the result of its behavior.
class SilentLog implements Log {

  @override
  void debug(final Object caller, final String method, final String message) {
    // Do nothing.
  }

  @override
  void info(final String message) {
    // Do nothing.
  }

}
