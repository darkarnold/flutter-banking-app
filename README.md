# banking_mobile_app

Sure, here's a basic README file for your Flutter banking mobile app:

This is a Flutter application for a banking mobile app. The app allows users to login with their email and password, and it's designed to be used on both iOS and Android devices.

## Prerequisites

Before running the app, make sure you have the following:

- Flutter SDK installed on your machine. You can download it from [here](https://flutter.dev/docs/get-started/install).
- An IDE of your choice, such as Android Studio or VS Code, with the Flutter and Dart plugins installed.
- An Android or iOS device for testing, or an emulator.

## Setup

1. Clone the repository to your local machine.

   ```bash
   git clone https://github.com/yourusername/bankMobileApp.git
   ```

2. Open the project in your IDE.

3. Run the following command to get the dependencies:

   ```bash
   flutter pub get
   ```

## Running the app

To run the app on an emulator or device, follow these steps:

1. Connect your device to your machine via USB, or start an emulator.

2. Run the following command to launch the app:

   ```bash
   flutter run
   ```

   If you want to run the app on a specific device, you can use the `--device` flag:

   ```bash
   flutter run --device Android SDK Gadget Serial
   ```

   Replace `Android SDK Gadget Serial` with the ID of your device.

## Assumptions

The following assumptions were made while building the app:

Any Android version below Android Sdk version 23 (Below Android 6 ) will not be able to run the application.

iOS devices below iOS 13 wont be able to run the application.

The splashscreen for Android 12 and above differs from those with other Android versions below 12.

## User access

In order to access the application here are the credentials
Email: admin@admin.com
Password: test123

## Dependencies

The following dependencies were used:

1. [firebase_core](https://pub.dev/packages/firebase_core)(3.2.0)
2. [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)(2.4.1)
3. [provider](https://pub.dev/packages/provider)(6.1.2)
4. [firebase_auth](https://pub.dev/packages/firebase_auth)(5.1.2)
5. [google_fonts](https://pub.dev/packages/google_fonts)(6.2.1)
6. [intl](https://pub.dev/packages/intl)(0.19.0)

## Contributing

If you want to contribute to this project, please follow these steps:

1. Fork the repository.

2. Create a new branch.

3. Make your changes.

4. Test your changes.

5. Commit your changes.

6. Push your changes to your forked repository.

7. Create a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
