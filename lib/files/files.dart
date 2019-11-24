/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'dart:io' as io;
import '../command/command.dart';
import '../file/file.dart';
import '../log/log.dart';

/// We expect [Command] to use this.
/// It represents the collection of [File]s that we need to check or format.
/// It's responsible for iterating the collection and let [File] to format itself.
class Files {

  /// Constructor.
  const Files(this._dir, this._fileFactory, this._log);

  /// It's for reading the directory.
  final io.Directory _dir;

  /// A function to create [File].
  /// We need a factory in order to test this.
  /// This function takes two parameters: [io.File], [Log].
  final Function _fileFactory;

  /// For logging.
  final Log _log;

  /// Check the files whether they are formatted correctly or not.
  /// It will return the exit code.
  /// 0 means all files are correctly formatted.
  /// 2 means not all files are correctly formatted.
  ///
  /// It will print "x out of n files are not correctly formatted."
  int check() {
    _log.debug(this, 'check()', 'Start checking the files.');
    final List<int> exitCodes = <int>[];
    final List<io.FileSystemEntity> entities = _dir.listSync(recursive: true);
    for (final io.File ioFile in entities) {
      if (ioFile.path.endsWith('.dart')) {
        final File file = _fileFactory(
          ioFile,
          _log
        );
        exitCodes.add(
          file.check()
        );
      }
    }
    _log
      ..info('${_defectAmount(exitCodes)} out of ${exitCodes.length} files are not correctly formatted.')
      ..debug(this, 'check()', 'End checking the files.');
    return _exitCode(exitCodes);
  }

  /// Format the files.
  /// It will return the exit code.
  /// 0 means success.
  /// 2 means errors.
  ///
  /// It will print "x out of n files are formatted."
  int format() {
    _log.debug(this, 'check()', 'Start formatting the files.');
    final List<int> exitCodes = <int>[];
    final List<io.FileSystemEntity> entities = _dir.listSync(recursive: true);
    for (final io.File ioFile in entities) {
      if (ioFile.path.endsWith('.dart')) {
        final File file = _fileFactory(
          ioFile,
          _log
        );
        exitCodes.add(
          file.format()
        );
      }
    }
    _log
      ..info('${_defectAmount(exitCodes)} out of ${exitCodes.length} files are formatted.')
      ..debug(this, 'check()', 'End formatting the files.');
    return _exitCode(exitCodes);
  }

  /// Return the number of non-zeros in [exitCodes].
  /// [exitCodes] A list contains the exit codes from iterating the [File]s.
  int _defectAmount(final List<int> exitCodes) {
    _log.debug(this, '_defectAmount()', 'Start counting the amount of defects.');
    int amount = 0;
    for (final int code in exitCodes) {
      if (code != 0) {
        amount++;
      }
    }
    _log.debug(this, '_defectAmount()', 'End counting the amount of defects. amount: $amount');
    return amount;
  }

  /// Return exit code after the iteration of [File]s.
  int _exitCode(final List<int> exitCodes) {
    _log.debug(this, '_exitCode()', 'Start getting the exit code.');
    int exitCode = 0;
    if (exitCodes.contains(2)) {
      exitCode = 2;
    }
    _log.debug(this, '_exitCode()', 'End getting the exit code. code: $exitCode');
    return exitCode;
  }

}
