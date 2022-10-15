import 'package:driver_package/driver_package.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await DriverPackage.init();

  runApp(DriverPackage(
    testServiceUrl: '',
    liveServiceUrl: '',
    fontFamilyName: 'hanimation',
    isTestMode: true,
    primaryColor: const Color(0xff005CAC),
    secondaryColor: const Color(0xff6FB642),
  ));
}


