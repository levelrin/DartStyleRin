/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'dart:io' as io;
import '../log/log.dart';
import 'files.dart';

/// We will use this when the user wants to format files under the current directory.
class CurrentFiles implements Files {

  /// Constructor.
  const CurrentFiles(this._filesFactory, this._log);

  /// A function to create [Files].
  /// It takes [io.Directory] as parameter and returns [Files].
  /// [io.Directory] will be the current directory.
  final Function _filesFactory;

  /// For logging.
  final Log _log;

  @override
  bool check() {
    final io.Directory dir = io.Directory.current;
    _log.debug(
      this,
      'check()',
      'Start creating the Files object with current directory: ${dir.path}'
    );
    final Files files = _filesFactory(dir);
    _log.debug(
      this,
      'check()',
      'End creating the Files object with current directory: ${dir.path}'
    );
    return files.check();
  }

  @override
  void format() {
    final io.Directory dir = io.Directory.current;
    _log.debug(
      this,
      'format()',
      'Start creating the Files object with current directory: ${dir.path}'
    );
    final Files files = _filesFactory(dir);
    _log.debug(
      this,
      'format()',
      'End creating the Files object with current directory: ${dir.path}'
    );
    return files.format();
  }

}
