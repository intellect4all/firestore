import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _user = Rx<User>();
  RxBool isSigningUp = false.obs;
  RxBool isLoggingIn = false.obs;

  String get user => _user.value?.email;

  @override
  // ignore: must_call_super
  void onInit() {
    _user.bindStream(_auth.userChanges());
  }

  void signUp(String email, String password) async {
    try {
      isSigningUp.value = true;
      await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      isSigningUp.value = false;
    } catch (e) {
      isSigningUp.value = false;
      Get.snackbar("Error creating your account", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void login(String email, String password) async {
    try {
      isLoggingIn.value = true;
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      Get.snackbar("Done!", 'Signed in successfully',
          snackPosition: SnackPosition.BOTTOM);
      isLoggingIn.value = false;
    } catch (e) {
      isLoggingIn.value = false;
      Get.snackbar("Error signing into your account", e.message,
          snackPosition: SnackPosition.BOTTOM,);
    }
  }

  void signOut() async {
    isLoggingIn.value = true;
    await Future.delayed(Duration(seconds: 3));
    await _auth.signOut();
    isLoggingIn.value = false;
  }
}
