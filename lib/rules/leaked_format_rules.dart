/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import '../report/report.dart';
import '../source/source.dart';
import 'rules.dart';

/// It's for testing.
/// You can inject a function, which will be executed by [format].
///
/// It's also a decorator.
/// For other methods, it will use the original object.
class LeakedFormatRules implements Rules {

  /// Constructor.
  const LeakedFormatRules(this._origin, this._callback);

  /// We will use this for other methods.
  final Rules _origin;

  /// This is a replacement for [format].
  /// The parameter and return type should be the same as [format].
  final Function _callback;

  @override
  Report check(final Source source) {
    return _origin.check(source);
  }

  @override
  Source format(final Source source) {
    return _callback(source);
  }

}
