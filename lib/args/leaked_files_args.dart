/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import '../files/files.dart';
import '../log/log.dart';
import 'args.dart';

/// It's for testing.
/// It will simply return the injected [Files].
/// It's a decorator and will use the original object for other methods.
class LeakedFilesArgs implements Args {

  /// Constructor.
  const LeakedFilesArgs(this._origin, this._files);

  /// We will use this for other methods.
  final Args _origin;

  /// We will return this.
  final Files _files;

  @override
  bool check() {
    return _origin.check();
  }

  @override
  bool debug() {
    return _origin.debug();
  }

  @override
  Files files(final Log log) {
    return _files;
  }

}
