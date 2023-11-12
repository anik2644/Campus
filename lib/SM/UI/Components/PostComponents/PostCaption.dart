import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../ModelClass/Post.dart';

class PostCaption extends StatefulWidget {
  final Post post;
  const PostCaption({required this.post});

  @override
  State<PostCaption> createState() => _PostCaptionState();
}

class _PostCaptionState extends State<PostCaption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Make the container take the full width
      child: Card(
        elevation: 25.0,
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 8.0, right: 8.0, bottom: 50.0, top: 8.0),
          child: Text(
            widget.post?.description as String,
            style: TextStyle(
              fontSize: 20,
              // fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
