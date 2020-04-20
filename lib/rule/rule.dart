/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import '../feedback/feedback.dart';
import '../source/source.dart';

/// It represents a formatting rule.
/// It's responsible for checking or formatting the [Source].
abstract class Rule {

  /// Check the source code whether it is formatted correctly or not.
  /// Returns the list of feedback.
  /// Empty list means no feedback.
  /// [source] Target source code.
  List<Feedback> check(final Source source);

  /// Format the source code.
  /// It will return the formatted [Source].
  /// [source] Target source code.
  Source format(final Source source);

}
