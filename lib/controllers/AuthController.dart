import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore/controllers/LoadingController.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _user = Rx<User>();
  LoadingController loader = Get.put(LoadingController());

  String get user => _user.value?.email;

  @override
  // ignore: must_call_super
  void onInit() {
    _user.bindStream(_auth.userChanges());
  }

  void signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("Error creating your account", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
          Get.snackbar("Done!", 'Signed in successfully',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Error signing into your account", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    await _auth.signOut();
  }
}
