import 'package:flutter/cupertino.dart';

import '../../../../ModelClass/Post.dart';


class PostTimestamp extends StatelessWidget {
  final Post? post;
  PostTimestamp(this.post);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Text(
        '${post?.timestamp ?? ""}',
        // timeago.format(post!.timestamp!.toDate()),
        style: TextStyle(fontSize: 10.0),
      ),
    );
  }
}
