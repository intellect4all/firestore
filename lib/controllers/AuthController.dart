import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _user = Rx<User>();
  var loading = false.obs;

  String get user => _user.value?.email;

  @override
  // ignore: must_call_super
  void onInit() {
    _user.bindStream(_auth.userChanges());
    
  }

  void signUp(String email, String password) async {
    try {

     dynamic res = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      loading = RxBool(false);
    } catch (e) {
      loading = RxBool(false);
      Get.snackbar("Error creating your account", e.message, snackPosition: SnackPosition.BOTTOM);
      
    }
  }

  void login(String email, String password) async {
    try {
      dynamic res = await _auth.signInWithEmailAndPassword(email: email, password: password);
      loading = RxBool(false);  
    }
     catch (e) {
      loading = RxBool(false);
      Get.snackbar("Error signing into your account", e.message, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    
    await _auth.signOut();
  
  }

}