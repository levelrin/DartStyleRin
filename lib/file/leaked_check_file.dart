/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'file.dart';

/// It's a decorator for testing.
/// You can inject the return value of [check].
/// For other methods, it will use the original object.
class LeakedCheckFile implements File {

  /// Constructor.
  // ignore: avoid_positional_boolean_parameters
  const LeakedCheckFile(this._origin, this._check);

  /// For other methods.
  final File _origin;

  /// We will return this.
  final bool _check;

  @override
  bool check() {
    return _check;
  }

  @override
  void format() {
    return _origin.format();
  }

}
