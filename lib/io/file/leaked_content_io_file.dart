/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'dart:convert';
import 'dart:io';
import 'ignored_io_file.dart';
import 'leaked_path_io_file.dart';

/// It's for testing.
/// You can inject a content as String.
/// It will simply return the injected content when you call [readAsStringSync].
/// It's a decorator and will use the original object for other methods.
class LeakedContentIoFile implements File {

  /// Primary constructor.
  const LeakedContentIoFile(this._origin, this._content);

  /// Secondary constructor.
  /// We will encapsulate [LeakedPathIoFile] as the original object.
  /// [path] We will return this on [LeakedContentIoFile.path].
  /// [content] See [_content].
  factory LeakedContentIoFile.withPath(final String path, final String content) {
    return LeakedContentIoFile(
      LeakedPathIoFile(path),
      content
    );
  }

  /// Secondary constructor.
  /// We will encapsulate [IgnoredIoFile] as the original object.
  /// [content] See [_content].
  factory LeakedContentIoFile.ignoreOthers(final String content) {
    return LeakedContentIoFile(
      IgnoredIoFile(),
      content
    );
  }

  /// We will use this for other methods.
  final File _origin;

  /// We will return this.
  final String _content;

  @override
  String readAsStringSync({final Encoding encoding = utf8}) {
    return _content;
  }

  @override
  String get path => _origin.path;

  @override
  dynamic noSuchMethod(final Invocation invocation) {
    throw UnimplementedError('Please define the method.');
  }

}
