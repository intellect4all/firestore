import 'package:firestore/controllers/AuthController.dart';
import 'package:firestore/views/authentication/login.dart';
import 'package:firestore/views/home/home.dart';
import 'package:flutter/material.dart';


import 'package:get/get.dart';

// ignore: must_be_immutable
class Root extends StatelessWidget {
  AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.user != null) ? Home()  : Login()
    );
  }
}