import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  GetStorage box = GetStorage();

  void loginWithGmail() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final response = await auth.signInWithCredential(credential);
      // print('response : $response');

      User? user = response.user;
      // print('user : $user');

      box.write('avatar', user!.photoURL);
      box.write('email', user.email);
      box.write('name', user.displayName);
      box.write('phone', user.phoneNumber);
      update();
      Get.offAllNamed('/');
    } catch (err) {
      Get.snackbar('Pesan', 'Terjadi kesalahan di server');
    }
  }
}
