/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'dart:io';
import '../../files/single_files.dart';

/// It's for testing and [SingleFiles].
/// You can inject a path.
/// It will simply return the injected path.
/// It will throw an exception for other methods.
class LeakedPathIoFile implements File {

  /// Constructor.
  const LeakedPathIoFile(this._path);

  /// We will return this.
  final String _path;

  @override
  String get path => _path;

  @override
  dynamic noSuchMethod(final Invocation invocation) {
    throw UnsupportedError('You are not supposed to use this.');
  }

}
