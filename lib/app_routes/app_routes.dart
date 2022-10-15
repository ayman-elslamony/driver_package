
import 'package:driver_package/screen/appointment/appointment_screen.dart';
import 'package:driver_package/screen/appointment_details/appointment_datails_screen.dart';
import 'package:driver_package/screen/authentication/login/login_screen.dart';
import 'package:driver_package/screen/google_map/google_map.dart';
import 'package:driver_package/screen/home/home_screen.dart';
import 'package:driver_package/screen/language/language_screen.dart';
import 'package:driver_package/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


part 'app_navigator.dart';


appRoutes(context) {

  var routes = {
    AppScreens.defaultScreen: (context) => const SplashScreen(),
    AppScreens.loginScreen: (context) =>  LoginScreen(),
    AppScreens.homeScreen: (context) =>   const HomeScreen(),
    AppScreens.languageScreen: (context) =>  const LanguageScreen(),
    AppScreens.appointmentScreen: (context) =>   AppointmentScreen(),
    AppScreens.appointmentDetailsScreen: (context) =>    AppointmentDetailsScreen(),
    AppScreens.locationMapScreen: (context) =>     LocationMapScreen()
  };
  return routes;
}

class AppScreens {
  static const String defaultScreen = "/";
  static const String loginScreen = "loginScreen";
  static const String homeScreen = "IntoScreen";
  static const String languageScreen = "LanguageScreen";
  static const String appointmentScreen = "AppointmentScreen";
  static const String appointmentDetailsScreen = "AppointmentDetailsScreen";
  static const String locationMapScreen = "LocationMapScreen";
}
