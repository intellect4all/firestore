import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String id;
  String title;
  String content;
  DateTime timestamp;

  Post({this.id, this.title, this.content, this.timestamp});

  factory Post.fromSnapshot(DocumentSnapshot snap) {
    return Post(
        id: snap.id,
        title: snap.data["title"],
        content: snap.data['content'],
        timestamp: snap.data['timestamp']
        );
  }
}
