/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'file.dart';

/// It's for testings.
/// No methods should be used from this object.
/// It will throw exceptions if any method is called.
/// You can use this when you need something just to fill out the parameters.
class IgnoredFile implements File {

  @override
  dynamic noSuchMethod(final Invocation invocation) {
    throw UnsupportedError('You are not supposed to use this.');
  }

}
