/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

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

  /// Iterate the [File]s and let them check themselves.
  /// True means all [File]s say there is no formatting issues.
  /// False means not.
  ///
  /// It will print "x out of n files are not correctly formatted."
  bool check() {
    _log.debug(this, 'check()', 'Start checking the files.');
    final List<io.FileSystemEntity> entities = _dir.listSync(recursive: true);
    int dartFileAmount = 0;
    int issueAmount = 0;
    for (final io.FileSystemEntity entity in entities) {
      if (entity is io.File && entity.path.endsWith('.dart')) {
        dartFileAmount++;
        final File file = _fileFactory(
          entity,
          _log
        );
        if (!file.check()) {
          issueAmount++;
        }
      }
    }
    _log
      ..info('$issueAmount out of $dartFileAmount files are not correctly formatted.')
      ..debug(this, 'check()', 'End checking the files.');
    return issueAmount == 0;
  }

  /// Iterate the [File]s and let them format themselves.
  /// Before each file formats itself, it will check if the file is already formatted or not.
  ///
  /// It will print "x out of n files are formatted."
  void format() {
    _log.debug(this, 'check()', 'Start formatting the files.');
    final List<io.FileSystemEntity> entities = _dir.listSync(recursive: true);
    int dartFileAmount = 0;
    int formatAmount = 0;
    for (final io.FileSystemEntity entity in entities) {
      if (entity is io.File && entity.path.endsWith('.dart')) {
        dartFileAmount++;
        final File file = _fileFactory(
          entity,
          _log
        );
        if (!file.check()) {
          file.format();
          formatAmount++;
        }
      }
    }
    _log
      ..info('$formatAmount out of $dartFileAmount files are formatted.')
      ..debug(this, 'check()', 'End formatting the files.');
  }

}
