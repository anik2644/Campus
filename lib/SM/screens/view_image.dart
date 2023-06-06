import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:like_button/like_button.dart';
// import 'package:social_media_app/models/post.dart';
// import 'package:social_media_app/models/user.dart';
// import 'package:social_media_app/utils/firebase.dart';
// import 'package:social_media_app/widgets/indicators.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../chats/recent_chats.dart';
import '../models/post.dart';
import '../models/user.dart';
import '../utils/firebase.dart';
import '../widgets/indicators.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'comment.dart';
class ViewImage extends StatefulWidget {
  final PostModel? post;

  ViewImage({this.post});

  @override
  _ViewImageState createState() => _ViewImageState();
}

final DateTime timestamp = DateTime.now();

currentUserId() {
  return firebaseAuth.currentUser!.uid;
}

UserModel? user;

class _ViewImageState extends State<ViewImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(),
        // leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: Icon(Icons.menu),
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //     );
        //   },
        // ),
        title:  Text(
          "ঢাবিয়ান সমাচার",//"Press me to enter",
          style: TextStyle(fontSize: 30,color: Colors.black, fontFamily: 'Alkatra',),
        ).animate(

          //delay: 1000.ms, // this delay only happens once at the very start
          onPlay: (controller) => controller.repeat(), // loop
        ).fadeIn(duration: 1500.ms).fadeOut(delay: 3500.ms, duration: 200.ms) // runs after fade.),
        ,
        // title: Text(
        //   Constants.appName,
        //   style: TextStyle(
        //     fontWeight: FontWeight.w900,
        //   ),
        // ),
        centerTitle: true,
        actions:
        [
          IconButton(
            icon: Icon(
              Ionicons.chatbubble,
              size: 30.0,
            ),
            onPressed: () {
              // print("hello");
              Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (_) => Comments(post: widget.post),
                  ),);
              //
              // Navigator.push(
              //   context,
              //   CupertinoPageRoute(
              //     builder: (_) => Chats(),
              //   ),
              // );
            },
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          //padding: const EdgeInsets.only(left: 2.0),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(widget.post?.description as String,style: TextStyle(fontSize: 20,),textAlign: TextAlign.left,),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 25,),
              Center(
                child: buildImage(context),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.post!.username!,
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 3.0),
                    Row(
                      children: [
                        Icon(Ionicons.alarm_outline, size: 13.0),
                        SizedBox(width: 6.0),
                        Text(
                            trimToDateString( widget.post?.timestamp as String),

                         // Timestamp.now().toDate().toString()
                           //widget.post?.timestamp as String,//
                         // timeago.format(widget.post!.timestamp!.toDate() ) as String,
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                buildLikeButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  bool isNumeric(String character) {
    return int.tryParse(character) != null;
  }
  String trimToDateString(String dateTimeString) {

    String trimmedString = '';

    for (int i = 0; i < dateTimeString.length; i++) {
      if (!isNumeric(dateTimeString[i])) {
        trimmedString += dateTimeString[i];
      } else {
        trimmedString += dateTimeString[i];
        break;
      }
    }

    print(trimmedString);
    return trimmedString;
  }

  buildImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: CachedNetworkImage(
          imageUrl: widget.post!.mediaUrl!,
          placeholder: (context, url) {
            return circularProgress(context);
          },
          errorWidget: (context, url, error) {
            return Icon(Icons.error);
          },
          height: 400.0,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }

  addLikesToNotification() async {
    bool isNotMe = currentUserId() != widget.post!.ownerId;

    if (isNotMe) {
      DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
      user = UserModel.fromJson(doc.data() as Map<String, dynamic>);
      notificationRef
          .doc(widget.post!.ownerId)
          .collection('notifications')
          .doc(widget.post!.postId)
          .set({
        "type": "like",
        "username": user!.username!,
        "userId": currentUserId(),
        "userDp": user!.photoUrl,
        "postId": widget.post!.postId,
        "mediaUrl": widget.post!.mediaUrl,
        "timestamp": timestamp,
      });
    }
  }

  removeLikeFromNotification() async {
    bool isNotMe = currentUserId() != widget.post!.ownerId;

    if (isNotMe) {
      DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
      user = UserModel.fromJson(doc.data() as Map<String, dynamic>);
      notificationRef
          .doc(widget.post!.ownerId)
          .collection('notifications')
          .doc(widget.post!.postId)
          .get()
          .then((doc) => {
                if (doc.exists) {doc.reference.delete()}
              });
    }
  }

  buildLikeButton() {
    return StreamBuilder(
      stream: likesRef
          .where('postId', isEqualTo: widget.post!.postId)
          .where('userId', isEqualTo: currentUserId())
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          List<QueryDocumentSnapshot> docs = snapshot.data?.docs ?? [];
          // return IconButton(
          //   onPressed: () {
          //     if (docs.isEmpty) {
          //       likesRef.add({
          //         'userId': currentUserId(),
          //         'postId': widget.post!.postId,
          //         'dateCreated': Timestamp.now(),
          //       });
          //       addLikesToNotification();
          //     } else {
          //       likesRef.doc(docs[0].id).delete();
          //       removeLikeFromNotification();
          //     }
          //   },
          //   icon: docs.isEmpty
          //       ? Icon(
          //           CupertinoIcons.heart,
          //         )
          //       : Icon(
          //           CupertinoIcons.heart_fill,
          //           color: Colors.red,
          //         ),
          // );
          ///added animated like button
          Future<bool> onLikeButtonTapped(bool isLiked) async {
            if (docs.isEmpty) {
              likesRef.add({
                'userId': currentUserId(),
                'postId': widget.post!.postId,
                'dateCreated': Timestamp.now(),
              });
              addLikesToNotification();
              return !isLiked;
            } else {
              likesRef.doc(docs[0].id).delete();
              removeLikeFromNotification();
              return isLiked;
            }
          }

          return LikeButton(
            onTap: onLikeButtonTapped,
            size: 25.0,
            circleColor:
                CircleColor(start: Color(0xffFFC0CB), end: Color(0xffff0000)),
            bubblesColor: BubblesColor(
              dotPrimaryColor: Color(0xffFFA500),
              dotSecondaryColor: Color(0xffd8392b),
              dotThirdColor: Color(0xffFF69B4),
              dotLastColor: Color(0xffff8c00),
            ),
            likeBuilder: (bool isLiked) {
              return Icon(
                docs.isEmpty ? Ionicons.heart_outline : Ionicons.heart,
                color: docs.isEmpty ? Colors.grey : Colors.red,
                size: 25,
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
