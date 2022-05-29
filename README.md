# Dart NeoML

Dart NeoML is a port of the cross-platform library [NeoML](https://github.com/neoml-lib/neoml) made by the company __ABBYY__.


## <a id='index'>Index</a>
- [Index](#index)
- [About](#about)
- [Motivation](#motivation)
  - [Why was NeoML chosen?](#choose-strategy)

## <a id='about'>About</a>

This package will help you easily create and train and use machine learning and neural network models in the Dart language based on the [NeoML](https://github.com/neoml-lib/neoml) framework


## <a id='motivation'>Motivation</a>

Among the neural network and machine learning libraries on dart that worked with C++ under the hood. Since C++ achieves high performance, with [dart-ffi](https://dart.dev/guides/libraries/c-interop) this can be achieved on the basis of the NeoML end-to-end framework.

### <a id='choose-strategy'>Why was NeoML chosen?</a>

- __Cross-platform__ framework that works on all known platforms Windows, Linux, macOS, Android, iOS (which have been fully supported since [Flutter 3.0.0](https://docs.flutter.dev/development/tools/sdk/release-notes/release-notes-3.0.0)).
- __High performance__. This was discussed by NeoML in an article on [Habr](https://habr.com/ru/company/abbyy/blog/506808/).
- __Usabillity for mobile__. It is possible to [serialize](https://github.com/neoml-lib/neoml#serialization-format) the trained model and use it on your mobile devices.
- __Backend__. Machine learning models are also used on the backend, where Dart also takes its place (for example, [AppWrite](https://appwrite.io/)). In the same [Django framework](https://www.djangoproject.com/), you can also use machine learning models, since Python is a favorable environment for this.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
