/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import '../files/files.dart';
import '../files/ignored_files.dart';
import '../log/log.dart';
import 'args.dart';

/// It's for testing.
/// You can use this when you don't care about the result of its behavior.
class SilentArgs implements Args {

  @override
  bool check() {
    return false;
  }

  @override
  bool debug() {
    return false;
  }

  @override
  Files files(final Log log) {
    return IgnoredFiles();
  }

}
