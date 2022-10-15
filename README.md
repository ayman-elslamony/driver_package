# Driver Package [![Flutter Badge](https://img.shields.io/badge/-Open-blue?logo=VisualStudio&logoColor=white&link=https://github.dev/Excellent-Protection/Driver-Package)](https://github.dev/Excellent-Protection/Driver-Package) [![Flutter Badge](https://img.shields.io/badge/-Open-grey?logo=GitHub&logoColor=white&link=https://github.com/Excellent-Protection/Driver-Package)](https://github.com/Excellent-Protection/Driver-Package)

## Why this Package ?

Created this package because the business for all the companies is the same as specific in driver application so found package is the best way to handel this type of business and speed up the system development lifecycle stages.
## Guide

### Setup the config For Your App


- Add your app images in `app_name/assets/images`

=>  Remember all images must have same name and same type

- Add your app font in `app_name/assets/fonts`


- Add Driver package to your `pubspec.yaml`

```yaml

# change version to be the same of backend version for android
version: 3.0.0

environment:
  sdk: ">=2.18.0 <3.0.0"


dependencies:
  flutter:
    sdk: flutter
    
# Get package from GitHub
 driver_package:
   git:
     url: "https://github.com/Excellent-Protection/Driver-Package.git"
     ref: "pre_production"
    #  if need to get from specific branch

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^1.0.0

  # Run This To Enable Splash Screen=> flutter pub run flutter_native_splash:create
  flutter_native_splash: ^2.2.10+1
flutter_native_splash:
  color: "#ffffff"
  image: "assets/images/default_splash.png"
  # add default_splash.png screen in assets/images
  android: true
  ios: true
  android_gravity: fill
  ios_content_mode: scaleAspectFill

  # Run This To set icon For the App => flutter pub run flutter_launcher_icons:main
  flutter_launcher_icons: ^0.10.0
flutter_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/images/app_icon.png"
  # add app_icon.png in assets/images

flutter:

  uses-material-design: true
  assets:
    - assets/images/

  fonts:
    - family: hanimation
      fonts:
        - asset: assets/fonts/hanimation-Regular.ttf

```

- Add Driver package to your `main.dart`

```dart
import 'package:driver_package/driver_package.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DriverPackage.init();
  
  //TODO: here change all data depend on your app info
  runApp(DriverPackage(
    testServiceUrl: '',
    liveServiceUrl: '',
    fontFamilyName: 'hanimation',
    isTestMode: true,
    primaryColor: const Color(0xff6FB642),
    secondaryColor: const Color(0xff005CAC),
  ));
}
```

### Setup the config For Android

- Add config to your `android/app/src/main/AndroidManifest.xml`


```xml
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <uses-permission android:name="android.permission.INTERNET" />
    <queries>
        <!-- If your app opens https URLs -->
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="https" />
        </intent>
        <!-- If your app makes calls -->
        <intent>
            <action android:name="android.intent.action.DIAL" />
            <data android:scheme="tel" />
        </intent>
    </queries>
```

$ But this lines between line 1 and 2

```xml 
1. <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com">

...

2. <application
```


- Add google map key in `android/app/src/main/AndroidManifest.xml`

just like this
```xml
       <application
       ...
        <activity...>
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
        // put your key here
       <meta-data android:name="com.google.android.geo.API_KEY" android:value=""/>
    </application>
```


### Setup the config For IOS

- Add permissions in `ios/Runner/Info.plist`
```plist
<plist version="1.0">
<dict>
    <key>NSLocationWhenInUseUsageDescription</key>
    <string>This app needs access to location when open.</string>
    ...
```

- Add google map key in `ios/Runner/AppDelegate.swift`
```swift
import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // put your key here
    GMSServices.provideAPIKey("AIzaSyChbbq9tDycWx9dWbE2xigyzWu5Myu_NNw")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```