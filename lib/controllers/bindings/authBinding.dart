import 'package:firebase_core/firebase_core.dart';
import 'package:firestore/controllers/PostController..dart';
import 'package:get/get.dart';

import '../AuthController.dart';

class AuthBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => PostController());
  }

}