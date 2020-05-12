/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'package:dart_style_rin/feedback/feedback.dart';
import 'package:dart_style_rin/report/ignored_report.dart';
import 'package:test/test.dart';

void main() {
  group('IgnoredReport', () {
    test('.addFeedback() should throw an exception.', () {
      expect(
        () => IgnoredReport().addFeedback(<Feedback>[]),
        throwsUnsupportedError
      );
    });
    test('.print() should throw an exception.', () {
      expect(
          () => IgnoredReport().print(),
        throwsUnsupportedError
      );
    });
    test('.pass() should throw an exception.', () {
      expect(
          () => IgnoredReport().pass(),
        throwsUnsupportedError
      );
    });
  });
}
