import 'package:firestore/controllers/PostController..dart';
import 'package:firestore/utils/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PostController postController = Get.put(PostController());

    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();

    return Obx(() => (postController.isAddingPosts.value == true)
        ? Loader()
        : Container(
            child: Scaffold(
              appBar: AppBar(
                title: Text('Add Post'),
                centerTitle: true,
              ),
              body: Container(
                width: double.infinity,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: 'Enter title here',
                      hintMaxLines: 2,
                      hintStyle: TextStyle(
                        letterSpacing: 2,
                        fontSize: 12,
                      ),
                    ),
                    style: TextStyle(color: Colors.amber, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: contentController,
                    decoration: InputDecoration(
                      hintText: 'Enter content here',
                      hintMaxLines: 2,
                      hintStyle: TextStyle(
                        letterSpacing: 2,
                        fontSize: 12,
                      ),
                    ),
                    style: TextStyle(color: Colors.amber, fontSize: 20),
                    maxLines: 999,
                    minLines: 8,
                  ),
                  RaisedButton(
                    onPressed: () {
                      postController.uploadPost(titleController.text.trim(),
                          contentController.text.trim());
                      titleController.clear();
                      contentController.clear();
                    },
                    child: Text(
                      'Post',
                    ),
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Cancel',
                    ),
                    color: Colors.blue,
                  ),
                ]),
              ),
            ),
          ));
  }
}
