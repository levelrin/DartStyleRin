/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import '../feedback/feedback.dart';
import 'report.dart';

/// It's for testing.
/// You can use this when you don't care about the result of its behavior.
class SilentReport implements Report {

  @override
  void addFeedback(final List<Feedback> feedbackList) {
    // Do nothing.
  }

  @override
  bool pass() {
    return false;
  }

  @override
  void print() {
    // Do nothing.
  }

}
