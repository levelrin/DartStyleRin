/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'dart:io' as io;
import 'package:args/args.dart';
import '../file/file.dart';
import '../files/current_files.dart';
import '../files/files.dart';
import '../files/single_files.dart';
import '../log/log.dart';
import '../rule/empty_line_at_end.dart';
import '../rule/no_consecutive_empty_lines.dart';
import '../rule/no_empty_indentation.dart';
import '../rule/no_empty_lines_between_imports.dart';
import '../rule/no_trailing_spaces.dart';
import '../rule/rule.dart';
import '../rules/rules.dart';

/// It represents the command line arguments from the user.
/// It's responsible for parsing the arguments and provide useful information.
class Args {

  /// Constructor.
  const Args(this._raw);

  /// Raw command line arguments from the user.
  final List<String> _raw;

  /// Check if --check flag is true.
  bool check() {
    return _results()['check'];
  }

  /// Check if --debug flag is true.
  bool debug() {
    return _results()['debug'];
  }

  /// Parse the arguments and return target files.
  /// [log] For logging.
  Files files(final Log log) {
    log.debug(this, 'files(Log)', 'Start creating Files object.');
    final ArgResults results = _results();
    Files files;
    if (results.rest.isEmpty || results.rest.first.isEmpty) {
      files = CurrentFiles(
        (io.Directory dir) => Files(
          dir,
          (final io.File ioFile, final Log log) => File(
            ioFile,
            _rules(log),
            log
          ),
          log
        ),
        log
      );
    } else if (results.rest.first.endsWith('.dart')) {
      files = SingleFiles(
        results.rest.first,
        (io.Directory dir) => Files(
          dir,
          (final io.File ioFile, final Log log) => File(
            ioFile,
            _rules(log),
            log
          ),
          log
        ),
        log
      );
    } else {
      files = Files(
        io.Directory(results.rest.first),
        (final io.File ioFile, final Log log) => File(
          ioFile,
          _rules(log),
          log
        ),
        log
      );
    }
    log.debug(this, 'files(Log)', 'End creating Files object: ${files.runtimeType}');
    return files;
  }

  /// Parse the raw command line arguments and return the result.
  ArgResults _results() {
    final ArgParser parser = ArgParser()
      ..addFlag('check', abbr: 'c')
      ..addFlag('debug');
    return parser.parse(_raw);
  }

  /// Create rules.
  /// This is the place we put all the formatting rules.
  /// [log] We need this to instantiate [Rules].
  Rules _rules(final Log log) {
    log.debug(this, '_rules()', 'Create Rules.');
    return Rules(
      <Rule>[
        NoEmptyIndentation(log),
        NoConsecutiveEmptyLines(log),
        NoTrailingSpaces(log),
        NoEmptyLinesBetweenImports(log),
        EmptyLineAtEnd(log)
      ],
      log
    );
  }

}
