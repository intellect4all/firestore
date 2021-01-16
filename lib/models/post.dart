import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String id;
  String title;
  String content;
  var timestamp;
  static final list = <Post>[];

  Post({this.id, this.title, this.content, this.timestamp});
  

  factory Post.fromSnapshot(QueryDocumentSnapshot snap) {
    return Post(
        id: snap.data()["id"],
        title: snap.data()["title"],
        content: snap.data()['content'],
        timestamp: snap.data()['timestamp']
        );
  }
}
