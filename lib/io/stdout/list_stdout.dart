/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'dart:io';

/// It's for testing.
/// We will add messages into the list instead of writing them on the console.
class ListStdout implements Stdout {

  /// Constructor.
  const ListStdout(this._record);

  /// We will add the message into this.
  final List<String> _record;

  @override
  void writeln([final Object object = '']) {
    _record.add(object);
  }

  @override
  dynamic noSuchMethod(final Invocation invocation) {
    throw UnsupportedError('You are not supposed to you this method.');
  }

}
