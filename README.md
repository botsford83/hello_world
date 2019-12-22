# Hello_world

hello_world is a training flutter application.

## Installation

#### Flutter
The following will help set up flutter on windows or mac

##### Windows
https://flutter.dev/docs/get-started/install/windows

##### Mac
https://flutter.dev/docs/get-started/install/macos

#### The following is needed to run flutter test with coverage.
```bash
brew install lcov
```
## Helpful flutter commands

#### Flutter unit test
```bash
flutter test
```
```bash
flutter test --no-color test --machine test
```

#### Flutter test with coverage
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

#### Flutter integration test
```bash 
flutter drive --target=test_driver/app.dart
```


