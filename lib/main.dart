import 'package:firebase_core/firebase_core.dart';
import 'package:firestore/controllers/AuthController.dart';
import 'package:firestore/controllers/bindings/authBinding.dart';
import 'package:firestore/root.dart';
import 'package:firestore/views/authentication/login.dart';
import 'package:firestore/views/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp defaultapp = await Firebase.initializeApp();
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: AuthBinder(),
      home: Root(),
    );
  }
}
