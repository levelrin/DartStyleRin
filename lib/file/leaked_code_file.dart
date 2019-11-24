/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'file.dart';

/// It's for testing.
/// You can inject the exit code and it will simply return that code.
class LeakedCodeFile implements File {

  /// Constructor.
  const LeakedCodeFile(this._exitCode);

  /// We will return this.
  final int _exitCode;

  @override
  int check() {
    return _exitCode;
  }

  @override
  int format() {
    return _exitCode;
  }

}
