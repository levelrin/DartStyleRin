/// Copyright (c) 2020 Rin (https://www.levelrin.com)
/// This file has been created under the terms of the MIT License.
/// See the details at https://github.com/levelrin/DartStyleRin/blob/master/LICENSE

import '../feedback/feedback.dart';
import '../line/line.dart';
import '../log/log.dart';
import '../source/source.dart';
import 'rule.dart';

/// It checks the indentation of the code and correct them.
class Indentation implements Rule {

  /// Constructor.
  const Indentation(this._log);

  /// For logging.
  final Log _log;

  @override
  List<Feedback> check(final Source source) {
    _log.debug(this, 'check()', 'Start checking the indentation.');
    final List<Feedback> feedbackList = <Feedback>[];
    int expectedIndentSize = 0;
    for (final Line line in source.lines()) {
      final String text = line.text();
      expectedIndentSize = expectedIndentSize + _currentIndentDelta(text);
      if (text.isNotEmpty && _indentSize(text) != expectedIndentSize) {
        feedbackList.add(
          Feedback(line, 'Expected indent size: $expectedIndentSize', _log)
        );
      }
      expectedIndentSize = expectedIndentSize + _nextIndentDelta(text);
    }
    _log.debug(this, 'check()', 'End checking the indentation.');
    return feedbackList;
  }

  @override
  Source format(final Source source) {
    _log.debug(this, 'format()', 'Indent the code.');
    final StringBuffer code = StringBuffer();
    int expectedIndentSize = 0;
    for (final Line line in source.lines()) {
      String text = line.text();
      expectedIndentSize = expectedIndentSize + _currentIndentDelta(text);
      if (text.isNotEmpty && _indentSize(text) != expectedIndentSize) {
        text = _indentedText(text, expectedIndentSize);
      }
      expectedIndentSize = expectedIndentSize + _nextIndentDelta(text);
      code.write('$text\n');
    }
    return Source(
      '${code.toString().trimRight()}\n',
      _log
    );
  }

  /// The number of indentation changes for the current [text].
  ///
  /// For example, let's say we have the following code:
  /// ```dart
  /// if (1 == 1) {
  ///   print('Do something.');
  /// } // <- Let's say this is the value of the text.
  /// ```
  /// As you can see, the indentation of the [text] should be decreased by 2
  /// compare to the previous line.
  ///
  /// In such cases, this method can be useful to adjust the indentation of
  /// the current [text].
  ///
  /// [text] A particular line of code.
  int _currentIndentDelta(final String text) {
    _log.debug(
      this,
      '_currentIndentDelta()',
      'Start calculating the current indent delta. text: $text'
    );
    final String modifiedText = _excludeLiterals(
      _excludeComments(text)
    );
    int delta = 0;
    if (_startsWithClosing(modifiedText)) {
      delta = -2;
    }
    _log.debug(
      this,
      '_currentIndentDelta()',
      'End calculating the current indent delta: $delta'
    );
    return delta;
  }

  /// The number of indentation changes for next lines of code from the [text].
  ///
  /// For example, let's say we have the following code:
  /// ```dart
  /// if (1 == 1) { // <- Let's say this is the value of the text.
  ///   print('Do something.');
  /// }
  /// ```
  /// As you can see, the indentation of the next line from the text has
  /// increased by 2 spaces.
  ///
  /// In such cases, this method can be useful to adjust the indentation of
  /// the next lines of code from the [text].
  ///
  /// [text] A particular line of code.
  int _nextIndentDelta(final String text) {
    _log.debug(
      this,
      '_nextIndentDelta()',
      'Start calculating the next indent delta. text: $text'
    );
    final String modifiedText = _excludeLiterals(
      _excludeComments(text)
    );
    int delta = _constrainedDelta(
      _bracketsIndentDelta(modifiedText)
    );
    if (_isWingShaped(modifiedText)) {
      delta = 2;
    } else if (_allClosed(modifiedText)) {
      delta = 0;
    }
    _log.debug(
      this,
      '_nextIndentDelta()',
      'End calculating the next indent delta: $delta'
    );
    return delta;
  }

  /// The number of indentation changes by the brackets in the [text].
  /// An opening bracket means +2 delta.
  /// A closing bracket means -2 delta.
  /// The return value will be the summation of all delta.
  ///
  /// For example, let's say we have the following code:
  /// ```dart
  /// if (param.flag()) { // <- Let's say this is the value of the text.
  ///   print('Do something.');
  /// }
  /// ```
  /// As you can see, the [text] contains 3 opening brackets and 2 closing
  /// brackets.
  /// That means the indentation of the next line should be increased by
  /// 2 because 2 + 2 + 2 - 2 - 2 = 2.
  ///
  /// This method can be useful to determine the indentation changes cause
  /// by the brackets.
  ///
  /// [text] A particular line of code.
  int _bracketsIndentDelta(final String text) {
    _log.debug(
      this,
      '_bracketsIndentDelta()',
      'Start calculating the indentation changes caused by brackets. text: $text'
    );
    int delta = 0;
    for (final int code in text.runes) {
      final String char = String.fromCharCode(code);
      switch (char) {
        case '{':
        case '(':
        case '[':
          delta = delta + 2;
          break;
        case '}':
        case ')':
        case ']':
          delta = delta - 2;
          break;
      }
    }
    _log.debug(
      this,
      '_bracketsIndentDelta()',
      'End calculating the indentation changes caused by brackets. delta: $delta'
    );
    return delta;
  }

  /// There is a case where a line contains multiple open brackets.
  /// For example,
  /// ```dart
  /// test('description', () { // This line contains multiple open brackets.
  ///   // content
  /// });
  /// ```
  /// In such case, we want to indent the next lines of code with
  /// 2 more spaces, not 4 more.
  /// Thus, the delta should not be greater than 2 or less or -2.
  ///
  /// This method will change the delta if necessary so that the delta will
  /// meet the above condition.
  ///
  /// [delta] The delta without constraints.
  int _constrainedDelta(final int delta) {
    _log.debug(
      this,
      '_constrainedDelta()',
      'Start applying the constraints to the delta: $delta'
    );
    int value = delta;
    if (value > 0) {
      value = 2;
    } else if (value < 0) {
      value = -2;
    }
    _log.debug(
      this,
      '_constrainedDelta()',
      'End applying the constraints to the delta. new value: $value'
    );
    return value;
  }

  /// Check if the [text] starts with a closing bracket.
  /// [text] A particular line of code.
  bool _startsWithClosing(final String text) {
    _log.debug(
      this,
      '_startsWithClosing()',
      'Start checking the text if it starts with a closing bracket. text: $text'
    );
    bool result = false;
    final Runes runes = text.trimLeft().runes;
    if (runes.isNotEmpty) {
      final String firstChar = String.fromCharCode(runes.first);
      switch (firstChar) {
        case '}':
        case ')':
        case ']':
          result = true;
          break;
      }
    }
    _log.debug(
      this,
      '_startsWithClosing()',
      'Start checking the text if it starts with a closing bracket. result: $result'
    );
    return result;
  }

  /// Check if the [text] starts with a closing bracket and ends with an
  /// opening bracket.
  /// For example, see the following code:
  /// ```dart
  /// if (1 == 1) {
  ///   print('Apple');
  /// } else if (1 == 1) { // <- wing-shaped
  ///   print('Banana');
  /// } else { // <- wing-shaped
  ///   print('Orange);
  /// }
  /// ```
  /// [text] A particular line of code.
  bool _isWingShaped(final String text) {
    _log.debug(
      this,
      '_isWingShaped()',
      'Start checking the text if it is wing-shaped. text: $text'
    );
    bool result = false;
    if (_startsWithClosing(text) && _bracketsIndentDelta(text) == 0) {
      result = true;
    }
    _log.debug(
      this,
      '_isWingShaped()',
      'End checking the text if it is wing-shaped. result: $result'
    );
    return result;
  }

  /// Check if the [text] is about closing the scope.
  /// For example, let's say we have the following code:
  /// ```dart
  /// test('yoi', () {
  ///   print('some test');
  /// }, skip: true); // <- This text is about closing the scope.
  /// ```
  /// [text] A particular line of code.
  bool _allClosed(final String text) {
    _log.debug(
      this,
      '_allClosed()',
      'Start checking if the text is about closing the scope. text: $text'
    );
    bool result = false;
    if (_startsWithClosing(text) && _bracketsIndentDelta(text) < 0) {
      result = true;
    }
    _log.debug(
      this,
      '_allClosed()',
      'End checking if the text is about closing the scope. result: $result'
    );
    return result;
  }

  /// Return the number of spaces that the [text] begins with.
  /// [text] We will analyze this.
  int _indentSize(final String text) {
    _log.debug(this, '_indentSize()', 'Start calculating the size of indentation.');
    int size = 0;
    for (final int code in text.runes) {
      final String char = String.fromCharCode(code);
      if (char == ' ') {
        size++;
      } else {
        break;
      }
    }
    _log.debug(this, '_indentSize()', 'End calculating the size of indentation. size: $size');
    return size;
  }

  /// We modify the [text] so that it will have leading spaces by [indentAmount].
  /// [text] We will remove exiting leading spaces and insert them from scratch.
  /// [indentAmount] The amount of leading spaces we will add.
  String _indentedText(final String text, final int indentAmount) {
    _log.debug(
      this,
      '_indentedText',
      'Adding a correct leading spaces into the text: $text by indentAmount: $indentAmount'
    );
    final StringBuffer spaces = StringBuffer();
    for (int x = 0; x < indentAmount; x++) {
      spaces.write(' ');
    }
    return '${spaces.toString()}${text.trimLeft()}';
  }

  /// We've had a problem that the indentation was miscalculated by the
  /// brackets inside of the comments.
  /// To avoid such problems, we should exclude the commented text.
  /// It will return the text without commented parts.
  /// [text] A particular line of code.
  String _excludeComments(final String text) {
    _log.debug(this, '_excludeComments()', 'Exclude the comments from the text: $text');
    return text.replaceAll(RegExp(r'\/{2,}.*'), '');
  }

  /// We've had a problem that the indentation was miscalculated by the
  /// brackets as string literals.
  /// To avoid such problems, we should exclude the string literals.
  /// It will return the text without string literals.
  /// [text] A particular line of code.
  String _excludeLiterals(final String text) {
    _log.debug(
      this,
      '_excludeLiterals()',
      'Start excluding the string literals from the text: $text'
    );
    final StringBuffer result = StringBuffer();
    bool literalStarted = false;
    String startingLiteral = '';
    for (final int code in text.runes) {
      final String char = String.fromCharCode(code);
      switch (char) {
        case '\'':
        case '"':
          if (startingLiteral == char) {
            startingLiteral = '';
            literalStarted = false;
          } else {
            startingLiteral = char;
            literalStarted = true;
          }
      }
      if (!literalStarted) {
        result.write(char);
      }
    }
    _log.debug(
      this,
      '_excludeLiterals()',
      'End excluding the string literals from the text. result: $result'
    );
    return result.toString();
  }

}
