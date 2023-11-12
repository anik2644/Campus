import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ionicons/ionicons.dart';

import '../../../ModelClass/Post.dart';

class PostTime extends StatefulWidget {
  final Post post;
  const PostTime({required this.post});

  @override
  State<PostTime> createState() => _PostTimeState();
}

class _PostTimeState extends State<PostTime> {
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Icon(Ionicons.time, size: 15.0),
          SizedBox(width: 8.0),
          Text(
            // Timestamp.now().toDate().toString(),
            widget.post!.timestamp!, //timeago.format(widget.post!.timestamp!.toDate()),
          ),
        ],
      ),
    )
    ;
  }
}
