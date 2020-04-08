/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'dart:io' as io;
import '../log/log.dart';
import '../rules/rules.dart';
import '../source/source.dart';

/// It represents the file we need to check or format.
/// It's responsible for formatting itself based on the [Rules].
///
/// Don't get confused with the [io.File] from the dart:io package.
/// This ([File]) has nothing to with input/output operations.
/// Take this as a domain object.
class File {

  /// Constructor.
  const File(this._ioFile, this._rules, this._log);

  /// It's for reading and writing a file.
  final io.File _ioFile;

  /// We will delegate formatting job to this.
  final Rules _rules;

  /// For logging.
  final Log _log;

  /// Apply [Rules] to check the file.
  /// True means the file is correctly formatted.
  /// False means not.
  bool check() {
    _log.debug(this, 'check()', 'Let Rules to check the source.');
    return _rules.check(
      Source(
        _ioFile.readAsStringSync(),
        _log
      )
    );
  }

  /// Apply [Rules] to format the file.
  void format() {
    _log.debug(this, 'format()', 'Let Rules to format the source.');
    _ioFile.writeAsStringSync(
      _rules.format(
        Source(
          _ioFile.readAsStringSync(),
          _log
        )
      ).toString()
    );
    _log.debug(this, 'format()', 'End rewritting the file.');
  }

}
