/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import '../files/files.dart';
import '../log/log.dart';
import 'args.dart';

/// A decorator for testing.
/// You can inject a [Function] and it will be executed if any method from the original object is called.
class CallbackArgs implements Args {

  /// Constructor.
  const CallbackArgs(this._origin, this._callback);

  /// We will decorate this.
  final Args _origin;

  /// This will be executed when any method from [_origin] is called.
  /// It should be a void function without any argument.
  final Function _callback;

  @override
  bool check() {
    final bool result = _origin.check();
    _callback();
    return result;
  }

  @override
  bool debug() {
    final bool result = _origin.debug();
    _callback();
    return result;
  }

  @override
  Files files(final Log log) {
    final Files result = _origin.files(log);
    _callback();
    return result;
  }

}
