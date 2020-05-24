#!/bin/sh

set -e
set -o pipefail

echo "Build Start"

dart script/check_headers.dart

pub get

analyzerReport=$(dartanalyzer lib test)
expectedAnalyzerReport="Analyzing lib, test...
No issues found!"
echo "$analyzerReport"
if [ "$analyzerReport" != "$expectedAnalyzerReport" ]; then
  exit 1
fi

dart bin/stylerin.dart --check

pub run test

threshold=90
coverageReport=$(pub run test_coverage --no-badge)
coverageRegex="Overall line coverage rate: ([0-9]*[.]?[0-9]+)%[.]"
echo "$coverageReport"
echo "Coverage Threshold: $threshold%"
if [[ $coverageReport =~ $coverageRegex ]]; then
  coverage="${BASH_REMATCH[1]}"
fi
if (( $(echo "$coverage < $threshold" |bc -l) )); then
  exit 1
fi

echo "Build Successful"
