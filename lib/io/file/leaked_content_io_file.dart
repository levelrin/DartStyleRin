/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'dart:convert';
import 'dart:io';

/// It's for testing.
/// You can inject a content as String.
/// It will simply return the injected content when you call [readAsStringSync].
/// It will throw an exception for other methods.
class LeakedContentIoFile implements File {

  /// Constructor.
  const LeakedContentIoFile(this._content);

  /// We will return this.
  final String _content;

  @override
  String readAsStringSync({final Encoding encoding = utf8}) {
    return _content;
  }

  @override
  dynamic noSuchMethod(final Invocation invocation) {
    throw UnsupportedError('You are not supposed to use this.');
  }

}
