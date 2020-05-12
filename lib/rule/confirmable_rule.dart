/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import '../feedback/feedback.dart';
import '../source/silent_source.dart';
import '../source/source.dart';
import 'rule.dart';

/// It's for testing.
/// It has extra methods to check whether certain method has been called or not.
class ConfirmableRule implements Rule {

  /// True if [check] has been called.
  bool _checkCalled = false;

  /// True if [format] has been called.
  bool _formatCalled = false;

  @override
  List<Feedback> check(final Source source) {
    _checkCalled = true;
    return <Feedback>[];
  }

  @override
  Source format(final Source source) {
    _formatCalled = true;
    return SilentSource();
  }

  /// See [_checkCalled].
  bool get checkCalled => _checkCalled;

  /// See [_formatCalled].
  bool get formatCalled => _formatCalled;

}
