library driver_package;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'src/app_routes/app_routes.dart';
import 'src/helper/app_translator.dart';
import 'src/helper/one_signal.dart';
import 'src/helper/requests_inspector.dart';
import 'src/utility/app_info.dart';
import 'src/utility/app_setting.dart';
import 'src/utility/app_theme.dart';
import 'src/utility/global_data.dart';

class DriverPackage extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
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
    Color? submitColor,
    Color? backColor,
    required Color secondaryColor,
    required String fontFamilyName,
    required bool showSignatureInStartShift,
    bool showNationalityCount = true,
    bool showSignature = true,
    bool enableFirebaseTracking = false,
    bool showDeliveryOrder = false,
    bool enableAnotherDomainFormat = false,
    Color? tableColor,
    String? oneSignalKey,
  }) {
    AppColors.init(
        primColor: primaryColor,
        secColor: secondaryColor,
        tblColor: tableColor,
        backColor: backColor,
        submitColor: submitColor);
    AppSetting.init(
        baseUrl: isTestMode == true ? testServiceUrl : liveServiceUrl,
        isTest: isTestMode);
    GlobalData.enableFirebaseTracking = enableFirebaseTracking;
    GlobalData.showNationalityCount = showNationalityCount;
    GlobalData.showSignatureInStart = showSignatureInStartShift;
    GlobalData.showSignature = showSignature;
    GlobalData.showOrderDelivery = showDeliveryOrder;
    GlobalData.enableAnotherDomainFormat = enableAnotherDomainFormat;
    AppFonts.init(fontFamilyName: fontFamilyName);
    // if onesignalKey not valid it handled to disable automatically
    if (oneSignalKey != null && oneSignalKey != '') {
      AppOneSignal.init(onesignalKey: oneSignalKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, widget) => GetMaterialApp(
              key: Key("driver key"),
              scaffoldMessengerKey: _scaffoldKey,
              navigatorKey: _navigatorKey,
              title: AppInfo.packageInfo.appName,
              debugShowCheckedModeBanner: false,
              theme: appTheme,
              translations: AppTranslator(),
              localizationsDelegates: AppTranslator.localizationsDelegates,
              supportedLocales: AppTranslator.supportedLocales,
              fallbackLocale: AppTranslator.fallbackLocale,
              locale: Locale(GlobalData.globalLang),
              initialRoute: AppScreens.defaultScreen,
              routes: appRoutes(context),
              builder: AppSetting.isTestMode == true
                  ? (context, getMaterialApp) {
                      return Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Stack(
                          children: [
                            getMaterialApp!,
                            const Positioned(
                              left: 0,
                              bottom: 0,
                              child: RequestInspector(),
                            )
                          ],
                        ),
                      );
                    }
                  : null,
            ));
  }
}
