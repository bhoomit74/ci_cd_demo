name: Super Extensions

on:
push:
branches:
- main
pull_request:
branches:
- main

jobs:

build:
runs-on: ubuntu-latest
steps:
- uses: actions/checkout@v3
- uses: subosito/flutter-action@v2
with:
channel: 'stable'
flutter-version: '3.7.5'

# Get flutter dependencies.
- name: Install Dependencies
run: flutter pub get

# Check for any formatting issues in the code.
- name: Analyze Formatting Errors
run: dart format --set-exit-if-changed .

# Statically analyze the Dart code for any errors.
- name: Analyze Linter Errors
run: dart analyze .

# Statically analyze the Dart code for any errors.
- name: Run Test Cases
run: flutter test --coverage

# Upload code coverage to codecov
# - name: Upload coverage reports to codecov
# uses: codecov/codecov-action@v3

# Dry Run Publish.
# - name: Dry Run Pub Publish
# run: flutter pub publish --dry-run

