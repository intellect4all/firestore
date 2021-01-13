import 'package:firestore/controllers/AuthController.dart';
import 'package:firestore/controllers/PostController..dart';
import 'package:firestore/views/home/add_post.dart';
import 'package:firestore/views/home/posts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          GestureDetector(
            child: Icon(Icons.post_add),
            onTap: () {
              Get.to(AddPost());
            },
          ),
        ],
      ),
      body: Posts(),
    );
  }
}
