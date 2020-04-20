/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'dart:convert';
import 'dart:io';

/// It's for testing.
/// It will do nothing when you call [writeAsStringSync].
/// It's a decorator and will use original object for other methods.
class SilentIoFile implements File {

  /// Constructor.
  const SilentIoFile(this._origin);

  /// We will use this for other methods.
  final File _origin;

  @override
  void writeAsStringSync(
    final String contents,
    {
      final FileMode mode = FileMode.write,
      final Encoding encoding = utf8,
      final bool flush = false
    }
  ) {
    // Do nothing.
  }

  @override
  String readAsStringSync({final Encoding encoding = utf8}) {
    return _origin.readAsStringSync(encoding: encoding);
  }

  @override
  dynamic noSuchMethod(final Invocation invocation) {
    throw UnsupportedError('Please define the method.');
  }

}
