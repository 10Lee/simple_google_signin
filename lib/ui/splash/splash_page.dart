import 'package:firebase_google_auth/ui/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
