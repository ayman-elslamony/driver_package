# Driver Package [![Flutter Badge](https://img.shields.io/badge/-Open-blue?logo=VisualStudio&logoColor=white&link=https://github.dev/Excellent-Protection/Driver-Package)](https://github.dev/Excellent-Protection/Driver-Package) [![Flutter Badge](https://img.shields.io/badge/-Open-grey?logo=GitHub&logoColor=white&link=https://github.com/Excellent-Protection/Driver-Package)](https://github.com/Excellent-Protection/Driver-Package)

## Why this Package ?

we created this package because the business for all the companies is the same as specific in driver application so we found package is the best way to handel this type of business and speed up the system development lifecycle stages.


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
# if you want to tracking driver need to add firebase
  # firebase_core: ^2.24.2
  # firebase_database: ^10.3.8
# - run => pug get  
# - In terminal: write => flutterFire config 
# - choose your project, 
# - select android to add all configs for firebase 

# Get package from GitHub
 driver_package:
   git:
     url: "https://github.com/CompanyName/Driver-Package.git"
     ref: "production"
    #  if need to get from specific branch

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^1.0.0


#****** if You want to add Splash Screen for the App ******
#   flutter_native_splash: ^2.2.10+1
# flutter_native_splash:
#   color: "#ffffff"
#   image: "assets/images/default_splash.png"
#   # add default_splash.png screen in assets/images
#   android: true
#   ios: true
#   android_gravity: fill
#   ios_content_mode: scaleAspectFill
# Run This To Enable Splash Screen=> flutter pub run flutter_native_splash:create

#****** if You want to add Icon for the App ******
#   flutter_launcher_icons: ^0.10.0
# flutter_icons:
#   android: "launcher_icon"
#   ios: true
#   image_path: "assets/images/app_icon.png"
# add app_icon.png in assets/images
# Run This To set icon => flutter pub run flutter_launcher_icons:main

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
  <!-- if you need to add firebase to tracking driver Add line 99 to 101 to add firebase config-->
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);
  //TODO: here change all data depend on your app info
  runApp(DriverPackage(
    testServiceUrl: '',
    liveServiceUrl: '',
    fontFamilyName: 'codec_bold',
    isTestMode: true,
    enableAnotherDomainFormat: false,
    showSignatureInStartShift: false,
    // here you can enable or disable driver tracking, 
    // just remember to add firebase config before enable  
    enableFirebaseTracking: true,
    showNationalityCount: true,
    showSignature: true,
    // false: show signature when Shift Status is Start
    // true: show signature when Shift Status is End
    showDeliveryOrder: true,
    primaryColor: const Color(0xff1FA397),
    secondaryColor: const Color(0xffCDDE22),
    oneSignalKey: "If using OneSignal But one signal Id Here",
  ));
}
```

### Setup the config For Android

- Add config to your `android/app/src/main/AndroidManifest.xml`


```xml
   <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <!-- If you added firebase. you need to add  ACCESS_BACKGROUND_LOCATION permission -->
    <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
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
       <meta-data android:name="com.google.android.geo.API_KEY" android:value="Add your map key here"/>
    </application>
```
### Set up OneSignal for Android in `android/app/build.gradle`

if you are using OneSignal in your app verify the Android compileSdkVersion is at least 33 for your project. Open your android/app/build.gradle file and inspect the compileSdkVersion property.
```gradle
// ...
android {
    compileSdkVersion 33
    // ...
}
// ...
```

### Setup the config For IOS

- Add permissions in `ios/Runner/Info.plist`
```plist
<plist version="1.0">
<dict>
    <key>NSLocationWhenInUseUsageDescription</key>
    <string>This app needs access to location when open.</string>
    ...
</dict>
</plist>
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
    GMSServices.provideAPIKey("Add your map key here")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```
### Set up OneSignal for IOS

if you are using OneSignal in your app follow setup in this link: 
[![Flutter Badge](https://img.shields.io/badge/-Open_link-grey?logo=&logoColor=white&link=https://documentation.onesignal.com/docs/flutter-sdk-setup)](https://documentation.onesignal.com/docs/flutter-sdk-setup)
