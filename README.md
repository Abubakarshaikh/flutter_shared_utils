Here’s a simple and effective `README.md` for your **flutter_shared_utils** package:

---

# flutter_shared_utils

A collection of utility functions for Flutter applications. The **flutter_shared_utils** package provides commonly used utilities to streamline your app development process and enhance functionality.

## Features

- **Date Formats**: Easily handle date formatting with predefined formats.
- **Device Information**: Retrieve information about the device using `DeviceInfoUtils`.
- **Device Settings**: Access and manage device settings using `DeviceSettingsUtils`.
- **Duration Formatting**: Format durations into user-friendly strings with `DurationFormatterUtils`.
- **Encryption Utilities**: Secure your data with `EncryptUtil`.
- **Regular Expressions**: Utilize regex patterns with `RegexUtil`.
- **Shadow Utilities**: Apply consistent shadow effects across your app using `ShadowUtils`.
- **Runtime Caching**: Manage in-memory caching with `RuntimeCachingUtil`.

## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_shared_utils: ^1.0.1
```

Run `flutter pub get` to install the package.

## Usage

To use the utility functions provided by this package, simply import it into your Dart file:

```dart
import 'package:flutter_shared_utils/flutter_shared_utils.dart';

void main() {
  // Example usage of DateFormats
  String formattedDate = DateFormats.format(DateTime.now());
  print('Formatted Date: $formattedDate');

  // Example usage of DeviceInfoUtils
  String deviceInfo = DeviceInfoUtils.getDeviceInfo();
  print('Device Info: $deviceInfo');

  // Example usage of DurationFormatterUtils
  String durationString = DurationFormatterUtils.formatDuration(Duration(hours: 2, minutes: 30));
  print('Formatted Duration: $durationString');
}
```

## Available Utilities

- **DateFormats**: Handles various date formatting.
- **DeviceInfoUtils**: Retrieves device information.
- **DeviceSettingsUtils**: Manages device settings.
- **DurationFormatterUtils**: Formats durations into readable strings.
- **EncryptUtil**: Provides encryption and decryption functionalities.
- **RegexUtil**: Offers regex patterns for validation and parsing.
- **ShadowUtils**: Applies consistent shadow effects to widgets.
- **RuntimeCachingUtil**: Implements runtime caching for improved performance.

## Example

Check out the [example directory](https://github.com/Abubakarshaikh/flutter_shared_utils/tree/main/example) for a full example of how to use the utilities in your app.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License

This package is licensed under the MIT License. See the [LICENSE](https://github.com/Abubakarshaikh/flutter_shared_utils/blob/main/LICENSE) file for more details.

---

Feel free to customize the links and examples based on your actual package components and repository structure! Let me know if you need any adjustments or further assistance.