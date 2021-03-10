# Flutter
Base project for Flutter

# Commons command line
Add path: export PATH=$PATH:/Users/toant1/Documents/flutter/bin

Build iOS: flutter build ios --release

Open simulator: open -a Simulator

Generate model: flutter packages pub run build_runner build
flutter packages pub run build_runner build --delete-conflicting-outputs

Generate icon: flutter pub pub run flutter_launcher_icons:main
Get packages: flutter packages get

Select XCode: sudo xcode-select --switch /Applications/Xcode11.app/Contents/Developer