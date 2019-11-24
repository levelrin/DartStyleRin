/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'dart:io' as io;
import '../io/directory/leaked_entities_dir.dart';
import '../io/file/leaked_path_io_file.dart';
import '../log/log.dart';
import 'files.dart';

/// The user may want to format a single file.
/// It's the same as [Files] but contains only one file.
class SingleFiles implements Files {

  /// Constructor.
  const SingleFiles(this._filePath, this._filesFactory, this._log);

  /// The file path that the user wants to format.
  final String _filePath;

  /// It takes [io.Directory] as a parameter and returns [Files] object.
  /// [io.Directory] will have only one file.
  final Function _filesFactory;

  /// For logging.
  final Log _log;

  @override
  int check() {
    _log.debug(
      this,
      'check()',
      'Start creating the Files object with the file path: $_filePath'
    );
    final Files files = _filesFactory(
      LeakedEntitiesDir(
        <io.File>[
          LeakedPathIoFile(_filePath)
        ]
      )
    );
    _log.debug(
      this,
      'check()',
      'End creating the Files object with the file path: $_filePath'
    );
    return files.check();
  }

  @override
  int format() {
    _log.debug(
      this,
      'format()',
      'Start creating the Files object with the file path: $_filePath'
    );
    final Files files = _filesFactory(
      LeakedEntitiesDir(
        <io.File>[
          LeakedPathIoFile(_filePath)
        ]
      )
    );
    _log.debug(
      this,
      'format()',
      'End creating the Files object with the file path: $_filePath'
    );
    return files.format();
  }

}
