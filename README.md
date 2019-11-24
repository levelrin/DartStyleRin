[![Build Status](https://travis-ci.org/levelrin/DartStyleRin.svg?branch=master)](https://travis-ci.org/levelrin/DartStyleRin)
[![Test Coverage](https://img.shields.io/codecov/c/github/levelrin/DartStyleRin.svg)](https://codecov.io/github/levelrin/DartStyleRin?branch=master)
[![](https://tokei.rs/b1/github/levelrin/DartStyleRin?category=code)](https://github.com/levelrin/DartStyleRin)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/levelrin/DartStyleRin/blob/master/LICENSE)

# DartStyleRin

DartStyleRin is a formatter for Dart code.
Although the Dart has its formatting tool such as the [dartfmt](https://dart.dev/tools/dartfmt), we do not like their formatting style.
We believe a code must be formatted to display object composition.

Let's say we want to format this code:
```dart
// TBD.
```

This is how the dartfmt formats the code:
```dart
// TBD.
```

This is how DartStyleRin formats the code:
```dart
// TBD.
```

As you can see, our formatting style displays the object composition more clearly.

## Quick Start

TBD.

## Features

### Format everything under the specified directory

```
stylerin relative_path_to_directory
```

### Format everything under the current directory

```
stylerin
```

### Format a file

```
stylerin relative_path_to_file
```

### Checking the format

You can use the `check` or `c` flag.
It will just check the code if it's correctly formatted or not. 
You may use this feature during the continuous integration.
For example,
```
stylerin --check
or
stylerin -c
```
The formatter will return the exit code.
- 0 means everything is correctly formatted.
- 2 means there is a file that is not formatted.

### Debugging

You can use the `debug` flag.
It will print the log for reporting bugs or trouble shooting.
For example,
```
stylerin --debug
```

## How to contribute?

TBD.
