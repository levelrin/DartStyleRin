/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import 'package:dart_style_rin/log/silent_log.dart';
import 'package:test/test.dart';

void main() {
  group('SilentLog', () {
    test('.debug() should not throw exception.', () {
      expect(
        () => SilentLog().debug('caller', 'method', 'message'),
        returnsNormally
      );
    });
    test('.info() should not throw exception', () {
      expect(
        () => SilentLog().info('message'),
        returnsNormally
      );
    });
  });
}
