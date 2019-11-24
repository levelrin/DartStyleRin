/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import '../source/source.dart';

/// It represents a formatting rule.
/// It's responsible for checking or formatting the [Source].
abstract class Rule {

  /// Check the source code whether it is formatted correctly or not.
  /// It will return the exit code.
  /// 0 means the source code is correctly formatted.
  /// 2 means the source code is not corrected formatted.
  /// [source] Target source code.
  int check(final Source source);

  /// Format the source code.
  /// It will return the exit code.
  /// 0 means success.
  /// 2 means errors.
  /// [source] Target source code.
  int format(final Source source);

}
