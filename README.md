# adaptive_widgets

A package which renders Cupertino or Material widgets depending on the target device.

## Getting Started

In your flutter project add the following dependency:

```
dependencies:
  ...
  adaptive_widgets: ^0.0.1
```

For help getting started with Flutter, view the online [documentation](https://flutter.io/).

## Usage

```dart
AdaptiveButton(
    child: Text('hello'),
    onPressed: () {},
);
```

will render a **CupertinoButton** on iOS and a **RaisedButton** on Android.

## Contribution

Spotted any mistakes? Open an issue or submit a PR!
