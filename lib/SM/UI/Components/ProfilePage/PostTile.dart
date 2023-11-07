import 'package:dhabiansomachar/SM/JSON_Management/model/PostJsonModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../ModelClass/Post.dart';
import '../../Widgets/CachedNetworkImage.dart';
import '../PostComponents/view_image.dart';


// import 'package:social_media_app/models/post.dart';
// import 'package:social_media_app/screens/view_image.dart';
// import 'package:social_media_app/widgets/cached_image.dart';

class PostTile extends StatefulWidget {
  final PostJsonModel? post;
  final int? ii;

  PostTile({this.post, this.ii});

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {

  Post converTopost(PostJsonModel element)
  {
    //Post post;
    return Post.Complete(element.id, element.postId, element.userName!, element.ownerId!, element.location!, element.timestamp!, element.mediaUrl!,element.description);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        print("Nottrying\n\n\n");
        print(widget.post?.id);
        print(widget.post?.description);
        print(widget.post?.ownerId);
        print(widget.post?.postId);
        print(widget.post?.userName);
        print(widget.post?.timestamp);
        print(widget.post?.mediaUrl);

        // widget.post?.username = "Hasam";
        print(widget.ii);
        Navigator.of(context).push(CupertinoPageRoute(
          builder: (_) => ViewImage(post: converTopost(widget.post!)),
        ));
      },

      child: Container(
        height: 100,
        width: 150,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(3.0),
            ),
            child: cachedNetworkImage(widget.post!.mediaUrl!),
          ),
        ),
      ),
    );
  }
}
