import 'package:firebase_google_auth/ui/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find<LoginController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Login with Google",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          InkWell(
            onTap: () => controller.loginWithGmail(),
            child: const CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/logo_google.png'),
            ),
          ),
        ],
      ),
    );
  }
}
