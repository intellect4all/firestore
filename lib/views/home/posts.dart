import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  DocumentReference snap;
  Posts({this.snap});

  @override
  Widget build(BuildContext context) {
    

    return ListView.builder(
      itemBuilder: (context, index) {
        return Card();
      }
    );
  }
}
