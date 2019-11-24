/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'files.dart';

/// It's for testing.
/// You can inject exit codes and it will simply return them.
class LeakedCodeFiles implements Files {

  /// Constructor.
  LeakedCodeFiles(this._checkExitCode, this._formatExitCode);

  /// Exit code from [LeakedCodeFiles.check].
  final int _checkExitCode;

  /// Exit code from [LeakedCodeFiles.format].
  final int _formatExitCode;

  @override
  int check() {
    return _checkExitCode;
  }

  @override
  int format() {
    return _formatExitCode;
  }

}
