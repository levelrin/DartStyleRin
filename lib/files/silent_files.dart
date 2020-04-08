/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'files.dart';

/// It's for testing.
/// You can use this when you don't care about the result of its behavior.
class SilentFiles implements Files {

  @override
  bool check() {
    return true;
  }

  @override
  void format() {
    // Do nothing.
  }

}
