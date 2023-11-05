import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import '../../../ModelClass/Content.dart';
import '../Common/custom_card.dart';
import '../Common/custom_image.dart';
import 'ViewSelectedContent.dart';

class ContentCard extends StatelessWidget {
  final Content post;

  String? Description;

  ContentCard({required this.post});
  final DateTime timestamp = DateTime.now();

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
          return //Container();//
            VIewSelectedContent(InputImagesSequence: post.AllImagesList, ContentImageSequence: post.ContentImageSequence, ContentSegments: post.ContentSegments, location: post.Location, title: post.Title);
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

                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0),
                    ),

                    child: CustomImage(
                      imageUrl: post?.AllImagesList[0] ?? '',
                      height: 350.0,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),


                  ),


                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 0.0),
                        //   child: Row(
                        //     children: [
                        //       buildLikeButton(),
                        //       SizedBox(width: 10.0),
                        //       InkWell(
                        //         borderRadius: BorderRadius.circular(10.0),
                        //         onTap: () {
                        //           // print("hello");
                        //           Navigator.of(context).push(
                        //             CupertinoPageRoute(
                        //               builder: (_) => Comments(post: post),
                        //             ),
                        //           );
                        //         },
                        //         child: Icon(
                        //           CupertinoIcons.chat_bubble,
                        //           size: 25.0,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(height: 5.0),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Flexible(
                        //       child: Padding(
                        //         padding: const EdgeInsets.only(left: 0.0),
                        //         child: StreamBuilder(
                        //           stream: likesRef
                        //               .where('postId', isEqualTo: post!.postId)
                        //               .snapshots(),
                        //           builder: (context,
                        //               AsyncSnapshot<QuerySnapshot> snapshot) {
                        //             if (snapshot.hasData) {
                        //               QuerySnapshot snap = snapshot.data!;
                        //               List<DocumentSnapshot> docs = snap.docs;
                        //               return buildLikesCount(
                        //                   context, docs.length ?? 0);
                        //             } else {
                        //               return buildLikesCount(context, 0);
                        //             }
                        //           },
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(width: 5.0),
                        //     StreamBuilder(
                        //       stream: commentRef
                        //           .doc(post!.postId!)
                        //           .collection("comments")
                        //           .snapshots(),
                        //       builder: (context,
                        //           AsyncSnapshot<QuerySnapshot> snapshot) {
                        //         if (snapshot.hasData) {
                        //           QuerySnapshot snap = snapshot.data!;
                        //           List<DocumentSnapshot> docs = snap.docs;
                        //           return buildCommentsCount(
                        //               context, docs.length ?? 0);
                        //         } else {
                        //           return buildCommentsCount(context, 0);
                        //         }
                        //       },
                        //     ),
                        //   ],
                        // ),
                        Visibility(
                          visible: post!.Title != null &&
                              post!.Title.toString().isNotEmpty,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0, top: 3.0),
                            child: Text(
                              '${post?.Title ?? ""}',
                              style: TextStyle(
                                color:
                                Theme.of(context).textTheme.caption!.color,
                                fontSize: 15.0,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ),
                        SizedBox(height: 3.0),
                      ],
                    ),
                  )


                ],
              ),
              //  buildUser(context,post),
            ],


          );
        },
      ),
    );
  }
}
