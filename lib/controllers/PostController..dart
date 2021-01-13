import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostController extends GetxController {
  final _firebase = FirebaseFirestore.instance;
  
  @override
  void onInit() {
    super.onInit();
    Rx<Future<QuerySnapshot>> posts = _firebase.collection('posts').get().obs;
  }
  

  void uploadPost(String title, String content) async {
    CollectionReference posts = _firebase.collection('posts');
    try {
      await posts.add({
        'title': title,
        'content': content,
        'timestamp': FieldValue.serverTimestamp(),
      });
      Get.snackbar('Done', 'Article Published successfully');
    } catch (e) {
      Get.snackbar('Error', 'Unable to post at this moment. Please try again');
    }
  }

}
