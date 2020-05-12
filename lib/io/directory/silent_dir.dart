/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'dart:io';

/// It's for testing.
/// You can use this when you don't care about the result of its behavior.
class SilentDir implements Directory {

  @override
  List<FileSystemEntity> listSync({bool recursive = false, bool followLinks = true}) {
    return <FileSystemEntity>[];
  }

  @override
  dynamic noSuchMethod(final Invocation invocation) {
    throw UnsupportedError('Please define the method.');
  }

}
