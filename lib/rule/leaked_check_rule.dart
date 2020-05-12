/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import '../feedback/feedback.dart';
import '../source/source.dart';
import 'ignored_rule.dart';
import 'rule.dart';

/// It's for testing.
/// You can inject the [Feedback] list and it will simply return that.
/// It's a decorator and will use the original object for other methods.
class LeakedCheckRule implements Rule {

  /// Primary constructor.
  const LeakedCheckRule(this._origin, this._feedbackList);

  /// Secondary constructor.
  /// We will use [IgnoredRule] as the original object.
  /// Use this constructor when you don't care about other methods.
  factory LeakedCheckRule.throwable(final List<Feedback> _feedbackList) {
    return LeakedCheckRule(IgnoredRule(), _feedbackList);
  }

  /// We will use this for other methods.
  final Rule _origin;

  /// We will return this.
  final List<Feedback> _feedbackList;

  @override
  List<Feedback> check(final Source source) {
    return _feedbackList;
  }

  @override
  Source format(final Source source) {
    return _origin.format(source);
  }

}
