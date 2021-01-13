import 'package:firestore/controllers/AuthController.dart';
import 'package:firestore/utils/loader.dart';
import 'package:firestore/views/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: unrelated_type_equality_checks
    if (controller.loading == RxBool(true)) {
      return Loader();
    } else {
      return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        width: double.infinity,
        child: Column(children: [
          Text('Login'),
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
              controller.login(emailController.text, passwordController.text);
            },
            child: Text(
              'Login',
            ),
            color: Colors.blue,
          ),
          FlatButton(
            onPressed: () {
              Get.to(SignUp());
            },
            child: Text(
              'Signup',
            ),
            color: Colors.blue,
          )
        ]),
      ),
    );
    }
  }
}
