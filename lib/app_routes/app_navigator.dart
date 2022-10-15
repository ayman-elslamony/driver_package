part of 'app_routes.dart';


goBack() {
  FocusScope.of(Get.context!).unfocus();
  Get.back();
}

goToScreen({required String screenNames, Object? arguments }) {

  FocusScope.of(Get.context!).unfocus();

  Get.toNamed(screenNames,arguments: arguments);
}

goToWithRemoveRoute({required String screenNames, Object? arguments}) {
  FocusScope.of(Get.context!).unfocus();

  Get.offAllNamed(screenNames, arguments: arguments,);

  // Navigator.of(Get.context!).pushNamedAndRemoveUntil(
  //     screenNames, (Route<dynamic> route) => false);
}

