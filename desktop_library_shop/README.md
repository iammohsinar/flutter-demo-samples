
# Flutter windows mac Desktop app integration with Mysql database

### For Flutter
This is just demo app for learning purpose, fork to understand the code architecture or watch full youtube videos tutorial.

### Configuration
Import [create.sql](https://github.com/iammohsinar/flutter-demo-samples/blob/ce47075f89fb57f82bce09251eaec252ab06cb9b/desktop_library_shop/db/create.sql) to `Mysql`

Change `Mysql` Database parameters in [db_connection.dart](https://github.com/iammohsinar/flutter-demo-samples/blob/ce47075f89fb57f82bce09251eaec252ab06cb9b/desktop_library_shop/lib/core/config/db_connection.dart), what you set on your machine.


### For windows
This app has support of win32.

to run on windows: type in cmd  `flutter run -d windows`

### For macOS
Please read: https://flutter.dev/desktop#entitlements-and-the-app-sandbox

add below permission in 

Path: `macos-->Runner` directory 

Files: `Release.entitlements` and `DebugProfile.entitlements` if required
```
<key>com.apple.security.network.client</key>
<true/>
```
to run on mac: type in terminal `flutter run -d macos`


### Created & Maintained By

[Mohsin AR](https://github.com/iammohsinar) 
([Youtube](https://www.youtube.com/c/CodeSeekhlo))

### full videos playlist tutorial

([Youtube](https://youtube.com/playlist?list=PLuBF1mtcoAFmjTQd-inuGk9Rvnn9cldJR))


## Screen shot

<img width="1789" alt="Screenshot 2021-11-17 at 2 14 37 PM" src="https://user-images.githubusercontent.com/6920703/152427000-c2eac2a0-097b-4c2c-bf13-fb0bde91ede9.png">


<img width="1790" alt="Screenshot 2021-11-16 at 4 48 07 AM" src="https://user-images.githubusercontent.com/6920703/152427082-63a2899e-c9ae-4d4f-afb6-808c14645c9a.png">




A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
