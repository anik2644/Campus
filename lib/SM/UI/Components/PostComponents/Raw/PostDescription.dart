import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../ModelClass/Post.dart';


class PostDescription extends StatelessWidget {
  final Post? post;
  PostDescription(this.post);


  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: post!.description != null &&
          post!.description.toString().isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, top: 3.0),
        child: Text(
          '${post?.description ?? ""}',
          style: TextStyle(
            color:
            Theme.of(context).textTheme.caption!.color,
            fontSize: 15.0,
          ),
          maxLines: 2,
        ),
      ),
    );
  }
}
