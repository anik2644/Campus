import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:like_button/like_button.dart';
// import 'package:social_media_app/components/custom_card.dart';
// import 'package:social_media_app/components/custom_image.dart';
// import 'package:social_media_app/models/post.dart';
// import 'package:social_media_app/models/user.dart';
// import 'package:social_media_app/pages/profile.dart';
// import 'package:social_media_app/screens/comment.dart';
// import 'package:social_media_app/screens/view_image.dart';
// import 'package:social_media_app/services/post_service.dart';
// import 'package:social_media_app/utils/firebase.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../ModelClass/Post.dart';
import '../PostComponents/Raw/ImageCard.dart';
import '../PostComponents/Raw/PostDescription.dart';
import '../PostComponents/Raw/PostTimestamp.dart';
import '../PostComponents/Raw/ProfileCard.dart';
import '../Common/custom_card.dart';
import '../PostComponents/view_image.dart';


class UserPost extends StatefulWidget {
  final Post? post;
  UserPost({this.post});

  @override
  State<UserPost> createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  final DateTime timestamp = DateTime.now();

  // currentUserId() {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {
        print("hekklo");
      },
      borderRadius: BorderRadius.circular(10.0),
      child: OpenContainer(
        transitionType: ContainerTransitionType.fadeThrough,
        openBuilder: (BuildContext context, VoidCallback _) {
          return ViewImage(post: widget.post);
        },
        closedElevation: 0.0,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        onClosed: (v) {},
        closedColor: Theme.of(context).cardColor,
        closedBuilder: (BuildContext context, VoidCallback openContainer) {

          return Stack(

            children: [
              Column(
                children: [

                  ImageCard(widget.post),

                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Row(
                            children: [
                           //   buildLikeButton(),
                              SizedBox(width: 10.0),
                              InkWell(
                                borderRadius: BorderRadius.circular(10.0),
                                onTap: () {
                                 // print("hello");
/*                                  Navigator.of(context).push(
                                    CupertinoPageRoute(
                                      builder: (_) => Comments(post: post),
                                    ),
                                  );*/
                                },
                                child: Icon(
                                  CupertinoIcons.chat_bubble,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: StreamBuilder(
                                  stream: likesRef
                                      .where('postId', isEqualTo: post!.postId)
                                      .snapshots(),
                                  builder: (context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasData) {
                                      QuerySnapshot snap = snapshot.data!;
                                      List<DocumentSnapshot> docs = snap.docs;
                                      return buildLikesCount(
                                          context, docs.length ?? 0);
                                    } else {
                                      return buildLikesCount(context, 0);
                                    }
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 5.0),
                            StreamBuilder(
                              stream: commentRef
                                  .doc(post!.postId!)
                                  .collection("comments")
                                  .snapshots(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasData) {
                                  QuerySnapshot snap = snapshot.data!;
                                  List<DocumentSnapshot> docs = snap.docs;
                                  return buildCommentsCount(
                                      context, docs.length ?? 0);
                                } else {
                                  return buildCommentsCount(context, 0);
                                }
                              },
                            ),*/
                          ],
                        ),
                        PostDescription(widget.post),
                        SizedBox(height: 3.0),
                        PostTimestamp(widget.post),
                        // SizedBox(height: 5.0),
                      ],
                    ),
                  )


                ],
              ),
               ProfileCard(widget.post),
             // buildUser(context,post),
            ],


          );
        },
      ),
    );
  }



}
