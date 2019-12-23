# Hello_world

hello_world is a training flutter application.

## Installation

#### Flutter
The following will help set up flutter on windows or mac remember after installing flutter you can run flutter doctor to check if things installed correctly
```bash 
flutter doctor
```

##### Windows
https://flutter.dev/docs/get-started/install/windows

##### Mac
https://flutter.dev/docs/get-started/install/macos

Install Flutter SDK
```bash 
git clone https://github.com/flutter/flutter.git
```
Install Dart SDK
```bash
brew tap dart-lang/dart
brew install dart
```

#### Android Studio
``` bash
https://developer.android.com/studio
```
After installing make sure and install the Flutter and Dart Plugin for the IDE.
After restarting the ide open up system preference and type in flutter.  Make sure Language and Framework is pointing to the correct flutter sdk.  Do the same for Dart.  

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


