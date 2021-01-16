import 'dart:async';

import 'package:firestore/models/post.dart';
import 'package:firestore/services/postServices.dart';
import 'package:firestore/views/home/home.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostController extends GetxController {
  PostServices _postServices = PostServices();
  RxList posts = <Post>[].obs;
  RxBool isAddingPosts = false.obs;
  RxBool isloadingPosts = false.obs;
  StreamSubscription _listener;

  @override
  void onInit() async {
    super.onInit();
    fetchData();
    print('starting initializing');
  }

  @override
  void onClose() {}

  void uploadPost(String title, String content) async {
    isAddingPosts.value = true;
    await _postServices.addPost(
      title,
      content,
    );
    isAddingPosts.value = false;
    Get.back();
    Get.snackbar('Done', 'Article Successfully posted!',
        snackPosition: SnackPosition.BOTTOM);
  }

  Future<void> fetchData() async {
    isloadingPosts.value = true;
    _listener = _postServices.getPost().snapshots().listen(
      (event) {
        posts.assignAll(
            event.docs.map((doc) => Post.fromSnapshot(doc)).toList());
        
      },
      
    );
    await Future.delayed(Duration(seconds: 2));
    isloadingPosts.value = false;
    // print('calling done');
    // for (var post in posts) {
    //   print(post.content);
    // }
  }
}
