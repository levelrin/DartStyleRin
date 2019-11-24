#!/bin/sh

echo "Build Start"

pub get || { exit 1; }

analyzerReport=$(dartanalyzer lib test) || { exit 1; }
expectedAnalyzerReport="Analyzing lib, test...
No issues found!"
echo "$analyzerReport"
if [ "$analyzerReport" != "$expectedAnalyzerReport" ]; then
  exit 1
fi

pub run test || { exit 1; }

threshold=90
coverageReport=$(pub run test_coverage --no-badge) || { exit 1; }
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
