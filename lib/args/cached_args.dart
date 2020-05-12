/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import '../files/files.dart';
import '../log/log.dart';
import 'args.dart';

/// A decorator for [Args].
/// It will cache the return values from its methods.
class CachedArgs implements Args {

  /// Constructor.
  CachedArgs(this._origin);

  /// We will cache the return values from this.
  final Args _origin;

  /// Cache for [Args.check].
  final List<bool> _checkCache = <bool>[];

  /// Cache for [Args.debug].
  final List<bool> _debugCache = <bool>[];

  /// Cache for [Args.files].
  final List<Files> _filesCache = <Files>[];

  @override
  bool check() {
    if (_checkCache.isEmpty) {
      _checkCache.add(_origin.check());
    }
    return _checkCache.first;
  }

  @override
  bool debug() {
    if (_debugCache.isEmpty) {
      _debugCache.add(_origin.debug());
    }
    return _debugCache.first;
  }

  @override
  Files files(final Log log) {
    if (_filesCache.isEmpty) {
      _filesCache.add(_origin.files(log));
    }
    return _filesCache.first;
  }

}
