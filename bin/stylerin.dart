/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'dart:io' as io;
import 'package:dart_style_rin/args/args.dart';
import 'package:dart_style_rin/args/cached_args.dart';
import 'package:dart_style_rin/command/command.dart';
import 'package:dart_style_rin/log/log.dart';

/// This is the executable file of DartStyleRin.
void main(final List<String> rawArgs) {
  final Args args = CachedArgs(
    Args(rawArgs)
  );
  io.exit(
    Command(
      args,
      Log(
        args,
        io.stdout
      )
    ).run()
  );
}
