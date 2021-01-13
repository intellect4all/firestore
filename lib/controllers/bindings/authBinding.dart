import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import '../AuthController.dart';

class AuthBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }

}