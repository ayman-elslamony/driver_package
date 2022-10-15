library driver_package;

import 'package:driver_package/helper/app_translator.dart';
import 'package:driver_package/app_routes/app_routes.dart';
import 'package:driver_package/helper/one_signal.dart';
import 'package:driver_package/helper/requests_inspector.dart';
import 'package:driver_package/utility/app_info.dart';
import 'package:driver_package/utility/app_setting.dart';
import 'package:driver_package/utility/app_theme.dart';
import 'package:driver_package/utility/global_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DriverPackage extends StatelessWidget {
  static init() async {
    await AppTranslator.getDefaultOrStoredLocal();
    await AppInfo.loadAppInfo();
  }

  DriverPackage({
    super.key,
    required String testServiceUrl,
    required String liveServiceUrl,
    required isTestMode,
    required Color primaryColor,
    required Color secondaryColor,
    required String fontFamilyName,
    Color? tableColor,
    String? onesignalKey,

  }) {
    AppColors.init(
        primColor: primaryColor,
        secColor: secondaryColor,
        tblColor: tableColor);
    AppSetting.init(
        baseUrl: isTestMode == true ? testServiceUrl : liveServiceUrl,
    isTest: isTestMode
    );
    AppFonts.init(fontFamilyName: fontFamilyName);
    // if onesignalKey not valid it handled to disable automatically
    if (onesignalKey != null && onesignalKey != '') {
      AppOneSignal.init(onesignalKey: onesignalKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, widget) => GetMaterialApp(
              // key: const Key("Driver Package"),
              // navigatorKey: GlobalKey<NavigatorState>(),
              // scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
              debugShowCheckedModeBanner: false,
              theme: appTheme,
              translations: AppTranslator(),
              localizationsDelegates: AppTranslator.localizationsDelegates,
              supportedLocales: AppTranslator.supportedLocales,
              fallbackLocale: AppTranslator.fallbackLocale,
              locale: Locale(GlobalData.globalLang),
              initialRoute: AppScreens.defaultScreen,
              routes: appRoutes(context),
          builder: AppSetting.isTestMode==true?(context,getMaterialApp){
            return  Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  getMaterialApp!,
                  const Positioned(
                    left: 0,
                    bottom: 0,
                    child:RequestsInspector(),
                  )
                ],
              ),
            );
          }:null,
            ));
  }
}
