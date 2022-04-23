import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeController extends GetxController {
  String name = '';
  String email = '';
  String phone = '';
  String avatar = '';

  GetStorage box = GetStorage();
  GoogleSignIn googleSignIn = GoogleSignIn();

  void getSessionData() {
    name = box.read('name') ?? 'name is null';
    email = box.read('email') ?? 'email is null';
    phone = box.read('phone') ?? 'phone is null';
    avatar = box.read('avatar') ??
        'https://image.makewebeasy.net/makeweb/0/3gDjiCqWt/migrate/product-20150715-140206.png';

    update();

    // print("name : $name, email: $email, phone: $phone, avatar: $avatar");
  }

  void logout() async {
    try {
      print('logout jalan');
      await box.erase();
      await googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
      Get.offAllNamed('/splash');
    } catch (err) {
      throw Exception();
    }
  }

  @override
  void onReady() {
    getSessionData();
    super.onReady();
  }
}
