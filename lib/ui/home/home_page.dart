import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (controller) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Selamat Datang ",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(controller.avatar),
              ),
              const SizedBox(height: 20.0),
              Text(
                "Name : ${controller.name}",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                "Email : ${controller.email}",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                "Phone : ${controller.phone}",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: ElevatedButton(
                  onPressed: () => controller.logout(),
                  child: Center(
                    child: Text("Logout"),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
