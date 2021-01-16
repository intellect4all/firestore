import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore/controllers/PostController..dart';
import 'package:firestore/models/post.dart';
import 'package:firestore/root.dart';
import 'package:firestore/views/home/home.dart';
import 'package:get/get.dart';

class PostServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addPost(String title, String content) async {
    PostController postController = Get.find();
    CollectionReference posts = _firestore.collection('posts');

    await posts.add({
      'title': title,
      'content': content,
      'timestamp': FieldValue.serverTimestamp(),
    }).timeout(Duration(seconds: 5), onTimeout: () {
      postController.isAddingPosts.value = false;
      Get.snackbar('Error', 'Unable to post at this moment. Please try again',
          snackPosition: SnackPosition.BOTTOM);
    }).catchError((error) {
      postController.isAddingPosts.value = false;
      Get.snackbar('Error', '${error.message}',
          snackPosition: SnackPosition.BOTTOM);
    }).whenComplete(() {
      postController.isAddingPosts.value = false;
    });
  }

  Query getPost() {
    return _firestore.collection('posts')
    .orderBy('timestamp', descending: false);
  }
}
