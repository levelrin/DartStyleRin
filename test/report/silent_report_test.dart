/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import 'package:dart_style_rin/feedback/feedback.dart';
import 'package:dart_style_rin/report/silent_report.dart';
import 'package:test/test.dart';

void main() {
  group('SilentReport', () {
    test('.addFeedback() should not throw an exception.', () {
      expect(
        () => SilentReport().addFeedback(<Feedback>[]),
        returnsNormally
      );
    });
    test('.pass() should not throw an exception.', () {
      expect(
        () => SilentReport().pass(),
        returnsNormally
      );
    });
    test('.print() should not throw an exception.', () {
      expect(
        () => SilentReport().print(),
        returnsNormally
      );
    });
  });
}
