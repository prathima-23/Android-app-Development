# Glucoscan

Glucoscan is a Flutter-based application that scans for nearby Bluetooth devices using the Flutter Blue Plus library. The application allows users to connect to detected devices and lays the groundwork for potential data transfer functionality.

---

## Features

- **Bluetooth Scanning:**
  - Discovers nearby Bluetooth devices using the Flutter Blue Plus package.
- **Device Listing:**
  - Displays a list of detected Bluetooth devices in a dialog.
- **Device Connection:**
  - Allows users to connect to the selected Bluetooth device.

---

## Prerequisites

To run this project, you need:

1. **Flutter SDK** (v3.0.0 or later):
   - Install Flutter from the [official website](https://flutter.dev/docs/get-started/install).
2. **Flutter Blue Plus Plugin:**
   - Add `flutter_blue_plus` to your `pubspec.yaml` file:
     ```yaml
     dependencies:
       flutter:
         sdk: flutter
       flutter_blue_plus: ^1.3.0
     ```
   - Run `flutter pub get` to install the dependencies.
3. **Bluetooth Permissions:**
   - Configure Bluetooth permissions for both Android and iOS platforms.

---

## Getting Started

1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```bash
   cd glucoscan
   ```
3. Run the application:
   ```bash
   flutter run
   ```

---

## Code Overview

### Main Components

1. **`MyHomePage`:**
   - Entry point for the application.
   - Contains a floating action button to scan for Bluetooth devices.

2. **Bluetooth Scanning:**
   - Initiates a scan using:
     ```dart
     FlutterBluePlus.startScan(timeout: Duration(seconds: 4));
     ```
   - Listens to scan results and updates the `scanResults` list.

3. **Device Connection:**
   - Allows users to connect to a device using:
     ```dart
     await result.device.connect();
     ```

---

## Permissions Setup

### Android

1. Add the following permissions to your `AndroidManifest.xml` file:
   ```xml
   <uses-permission android:name="android.permission.BLUETOOTH" />
   <uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />
   <uses-permission android:name="android.permission.BLUETOOTH_SCAN" />
   <uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
   <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
   ```

2. For devices running Android 12 or later, add the following to the `application` tag:
   ```xml
   <uses-permission android:name="android.permission.BLUETOOTH_ADVERTISE" />
   ```

3. Ensure you handle runtime permissions for Android 6.0 (API level 23) and above.

### iOS

1. Add the following to your `Info.plist` file:
   ```xml
   <key>NSBluetoothPeripheralUsageDescription</key>
   <string>This app uses Bluetooth to connect to nearby devices.</string>
   <key>NSLocationAlwaysUsageDescription</key>
   <string>Location access is required to scan for Bluetooth devices.</string>
   <key>NSLocationWhenInUseUsageDescription</key>
   <string>Location access is required to scan for Bluetooth devices.</string>
   ```

2. Enable the Bluetooth background mode in Xcode:
   - Go to your project settings.
   - Under the "Capabilities" tab, enable the "Background Modes" feature.
   - Check "Uses Bluetooth LE accessories."

---

## Future Improvements

- Add error handling for Bluetooth connection failures.
- Implement data transfer logic after connecting to devices.
- Enhance the UI for better user experience.
- Optimize Bluetooth scanning for improved performance.

---

## Disclaimer

This project is intended for educational purposes and basic demonstrations of Flutter's Bluetooth capabilities. Ensure compliance with local laws and regulations regarding Bluetooth device connections.
