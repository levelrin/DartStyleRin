/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'dart:io';
import '../../files/single_files.dart';

/// It's for testing and [SingleFiles].
/// You can inject a list of [File]s.
/// It will simply return the injected object when you call [Directory.listSync].
/// It will throw an exception for other methods.
class LeakedEntitiesDir implements Directory {

  /// Constructor.
  LeakedEntitiesDir(this._entities);

  /// We will return this.
  final List<FileSystemEntity> _entities;

  @override
  List<FileSystemEntity> listSync({bool recursive = false, bool followLinks = true}) {
    return _entities;
  }

  @override
  dynamic noSuchMethod(final Invocation invocation) {
    throw UnsupportedError('You are not supposed to use this.');
  }

}
