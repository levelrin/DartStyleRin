/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import '../source/source.dart';
import 'ignored_rule.dart';
import 'rule.dart';

/// It's for testing.
/// You can inject the [bool] and it will simply return that.
/// It's a decorator and will use the original object for other methods.
class LeakedCheckRule implements Rule {

  /// Primary constructor.
  // ignore: avoid_positional_boolean_parameters
  const LeakedCheckRule(this._origin, this._check);

  /// Secondary constructor.
  /// We will use [IgnoredRule] as the original object.
  /// Use this constructor when you don't care about other methods.
  // ignore: avoid_positional_boolean_parameters
  factory LeakedCheckRule.throwable(final bool _check) {
    return LeakedCheckRule(IgnoredRule(), _check);
  }

  /// We will use this for other methods.
  final Rule _origin;

  /// We will return this.
  final bool _check;

  @override
  bool check(final Source source) {
    return _check;
  }

  @override
  Source format(final Source source) {
    return _origin.format(source);
  }

}
