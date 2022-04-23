import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_google_auth/ui/home/home_binding.dart';
import 'package:firebase_google_auth/ui/home/home_page.dart';
import 'package:firebase_google_auth/ui/login/login_binding.dart';
import 'package:firebase_google_auth/ui/login/login_page.dart';
import 'package:firebase_google_auth/ui/splash/splash_binding.dart';
import 'package:firebase_google_auth/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/splash',
          page: () => SplashPage(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginPage(),
          binding: LoginBinding(),
        ),
      ],
      initialRoute: '/splash',
    );
  }
}
