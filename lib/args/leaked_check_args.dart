/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import '../files/files.dart';
import '../log/log.dart';
import 'args.dart';

/// It's for testings.
/// You can inject the --check flag value and it will simply return it.
/// It's a decorator and will use original object for other methods.
class LeakedCheckArgs implements Args {

  /// Constructor.
  // ignore: avoid_positional_boolean_parameters
  const LeakedCheckArgs(this._origin, this._check);

  /// We will use this for other methods.
  final Args _origin;

  /// We will simply return this.
  final bool _check;

  @override
  bool check() {
    return _check;
  }

  @override
  bool debug() {
    return _origin.debug();
  }

  @override
  Files files(final Log log) {
    return _origin.files(log);
  }

}
