import 'package:firestore/models/post.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostController extends GetxController {
  final _firebase = FirebaseFirestore.instance;
  final posts = [].obs;
  

  @override
  void onInit() {
    super.onInit();
  }

  void uploadPost(String title, String content) async {
    CollectionReference postss = _firebase.collection('posts');
    try {
      await postss.add({
        'title': title,
        'content': content,
        'timestamp': FieldValue.serverTimestamp(),
      });
      Get.snackbar('Done', 'Article Published successfully');
    } catch (e) {
      Get.snackbar('Error', 'Unable to post at this moment. Please try again');
    }
  }

  void getPost() async {
    CollectionReference postss = _firebase.collection('posts');
    Get.snackbar('Loading', 'We are getting data from the server', showProgressIndicator: true, snackPosition: SnackPosition.BOTTOM);
    await postss.orderBy('timestamp').get().then(
        (QuerySnapshot querySnapshot) => querySnapshot.docs.forEach((doc) {
              Post post = Post.fromSnapshot(doc);
              this.addPost(post);
              
            }));
    await Future.delayed(Duration(seconds: 5));
    Get.snackbar('Done', 'Here is the data', snackPosition: SnackPosition.BOTTOM);
  }

  void addPost(Post post) {
    posts.add(post);
  }

  void addPosts() async {
    CollectionReference postss = _firebase.collection('posts');
    QuerySnapshot snapshot = await postss.get();
  }
}
