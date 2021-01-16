import 'package:firestore/controllers/AuthController.dart';
import 'package:firestore/controllers/PostController..dart';
import 'package:firestore/utils/loader.dart';
import 'package:firestore/views/home/add_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PostController postController = Get.put(PostController());
    AuthController authController = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(Icons.logout),
          onTap: () {
            authController.signOut();
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
                postController.fetchData();
              },
              child: Text('Fetch One Data'),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Fetch multiple data'),
            ),
            
            Obx(() => ((postController.isloadingPosts.value == true) ? Loader() : Expanded(
                    child: ListView.builder(

                      itemCount: postController.posts.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(children: [
                                  Text(postController.posts[index].title),
                                ]),
                                Row(
                                  children: [
                                    Text(postController.posts[index].content),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ))
)          ],
        ),
      ),
    );
  }
}
