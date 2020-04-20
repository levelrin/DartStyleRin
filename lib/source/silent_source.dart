/*
 * Copyright (c) 2020 Rin (https://www.levelrin.com)
 *
 * This file has been created under the terms of the MIT License.
 * See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE
 */

import '../line/line.dart';
import 'source.dart';

/// It's for testing.
/// You can use this when you don't care about the result of its behavior.
// ignore: avoid_implementing_value_types
class SilentSource implements Source {

  @override
  List<Line> lines() {
    return <Line>[];
  }

}
