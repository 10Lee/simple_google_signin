import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  GetStorage box = GetStorage();

  void checkAuth() {
    Timer(Duration(seconds: 2), () {
      if (GetStorage().hasData('auth')) {
        Get.offAllNamed('/');
      } else {
        Get.offAllNamed('/login');
      }
    });
  }

  @override
  void onReady() {
    checkAuth();
    super.onReady();
  }
}
