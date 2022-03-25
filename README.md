
This package is using MAPMYINDIA's REST APIs under the hood

## Features

- AutoSuggest API
- Still Map API
- Geocode API

## Getting started

add the package into your pubspec.yaml file
```yaml
map_my_india:
  git:
    url: https://github.com/Jagrajsinghji/map_my_india
    ref: main
```

## Usage

At first you have to setup your `MapMyIndiaAccountManager` and call `configure` on `MapMyIndia` instance.
```dart
MapMyIndiaAccountManager accountManager =
MapMyIndiaAccountManager(apiKey: "your-api-key", clientId: "your-client-id", clientSecret: "your-client-secret");
MapMyIndia mapMyIndia = MapMyIndia();
mapMyIndia.configure(accountManager);
```

## Additional information

Will be updating this package with other APIs too.
PRs are welcome
