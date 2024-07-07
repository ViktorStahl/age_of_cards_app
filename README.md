# age_of_cards_app

Mobile app for Age of Cards

## Getting Started

### `flutter pub get`
Downloads the dependencies specified in [pubspec.yaml](./pubspec.yaml).

### Local Storage 
The app uses `dart:io` and [Dart's path_provider package](https://pub.dev/packages/path_provider) 
to store data as a single JSON file to the local device.

Data is serialized to JSON with the `dart:convert` and `json_serializable` packages which enables 
annotations and can generate files for serializing to and from JSON. The generated files are named 
`<filename>.g.dart`. To generate files run one of the following commands in the project root folder:
```bash
# One time build
dart run build_runner build --delete-conflicting-outputs
# Continuous build with watcher
dart run build_runner watch --delete-conflicting-outputs
```

## (coming) Features

### Build warband

#### Build

##### Create list
* Choose faction
* Name list
* Add characters
##### Create character
* Name
* Race
* Equipment
### Save
### Load