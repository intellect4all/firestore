import 'package:firestore/controllers/AuthController.dart';
import 'package:firestore/utils/loader.dart';
import 'package:firestore/views/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    if (controller.loading == RxBool(true)) {
      return Loader();
    } else { return 
      Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(children: [
            Text('Sign Up here'),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.white, fontSize: 20),
              ),
              maxLength: 255,
              maxLines: 1,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.white, fontSize: 20),
              ),
              maxLength: 60,
              maxLines: 1,
            ),
            RaisedButton(
              onPressed: () async {
                controller.loading = RxBool(true);
                controller.signUp(
                    emailController.text, passwordController.text);
              },
              child: Text(
                'SignUp',
              ),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Get.offAll(Login());
              },
              child: Text(
                'Login',
              ),
              color: Colors.blue,
            ),
          ]),
        ),
      );
    }
  }
}
