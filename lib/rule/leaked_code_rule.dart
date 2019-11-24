/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import '../source/source.dart';
import 'rule.dart';

/// It's for testing.
/// You can inject the exit code and it will simply return that code.
class LeakedCodeRule implements Rule {

  /// Constructor.
  const LeakedCodeRule(this._exitCode);

  /// We will return this.
  final int _exitCode;

  @override
  int check(final Source source) {
    return _exitCode;
  }

  @override
  int format(final Source source) {
    return _exitCode;
  }

}
