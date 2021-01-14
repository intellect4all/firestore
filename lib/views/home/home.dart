import 'package:firestore/controllers/AuthController.dart';
import 'package:firestore/controllers/PostController..dart';
import 'package:firestore/views/home/add_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {

    PostController postController = Get.put(PostController());
    

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(Icons.logout),
          onTap: () {
            controller.signOut();
          },
        ),
        actions: [
          GestureDetector(
            child: Icon(Icons.post_add),
            onTap: () {
              Get.to(AddPost());
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                
                postController.getPost();
              },
              child: Text('Fetch One Data'),
            ),
            RaisedButton(
              onPressed: () {
                
                postController.addPosts();
              },
              child: Text('Fetch multiple data'),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [(postController.posts.isEmpty)? Text('Sample'):Text(postController.posts[0].title),]
                    ),
                    Row(children: [
                      (postController.posts.isEmpty)? Text('testss'):Text(postController.posts[0].content),
                    ],)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
