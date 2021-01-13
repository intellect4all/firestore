import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore/controllers/PostController..dart';
import 'package:firestore/models/post.dart';
import 'package:firestore/views/home/posts.dart';

class PostService {
  CollectionReference postsRef = FirebaseFirestore.instance.collection('posts');
  
  
  Future<void> getPosts() async {
    Stream<QuerySnapshot> snap = postsRef.snapshots();

    
    
  }

  }