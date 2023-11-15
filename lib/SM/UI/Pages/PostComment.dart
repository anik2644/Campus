import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhabiansomachar/SM/JSON_Management/model/UserJsonModel.dart';
import 'package:dhabiansomachar/SM/ModelClass/LoginCredential.dart';
import 'package:dhabiansomachar/SM/Utilites/Helper/Raw/RawConvertion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:like_button/like_button.dart';

import 'package:timeago/timeago.dart' as timeago;

import '../../JSON_Management/model/CommentModel.dart';
import '../../ModelClass/Post.dart';
import '../../ModelClass/User.dart';
import '../../Utilites/Constants/firebase.dart';
import '../Components/Comment/CommentsStreamWrapper.dart';
import '../Widgets/CachedNetworkImage.dart';


class Comments extends StatefulWidget {
  final Post? post;

  Comments({this.post});

  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  User? user;
   bool isLoading = true;
   List<CommentModel> comments = [];
 // PostService services = PostService();
  final DateTime timestamp = DateTime.now();
  TextEditingController commentsTEC = TextEditingController();

  currentUserId() {
    return LoginCredentials().loggedInUser!.id;
  }

  Future<void> fetchComments() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await commentRef.doc(widget.post!.id).collection('comments')
          .orderBy('timestamp', descending: true)
          .get();

         comments = snapshot.docs.map((doc) {
        return CommentModel.fromJson(doc.data()!);
      }).toList();


      for (CommentModel comment in comments) {
        print(comment.comment);
        print(comment.username);
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching comments: $e');
    }
  }

  Widget buildEachComment(CommentModel comments)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: CachedNetworkImageProvider(comments.userDp!),
              ),
              SizedBox(width: 10.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comments.username!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    timeago.format(comments.timestamp!.toDate()),
                    style: TextStyle(fontSize: 10.0),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Text( comments.comment!.trim()),
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  @override
  void initState() {

    fetchComments();
    // TODO: implement initState
    super.initState();
  }

  Future<void> _refreshData() async {

    isLoading =true;
    setState(() {

    });
    fetchComments();
    setState(() {
      print(user?.userName);
    });
  }


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.xmark_circle_fill,
          ),
        ),
        centerTitle: true,
        title: Text('Comments'),
        actions: [
/*          IconButton(onPressed: (){
           // fetchComments();
          }, icon: Icon(Icons.print))*/
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: buildFullPost(),
                  ),
                  Divider(thickness: 1.5),

                 isLoading? Container(
                   height: 500,
                   child: CircularProgressIndicator(),
                 ):comments.length ==0?
                 Container(
                   height: 500,
                   child: Padding(
                     padding: const EdgeInsets.only(top:20.0),
                     child: Text("No Comments", style: TextStyle(fontSize: 20),),
                   ),
                 ):
                 Container(
                    height: MediaQuery.of(context).size.height - 400, // Adjust the height accordingly
                    child: ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        return buildEachComment(comments[index]);

/*                        ListTile(
                          title: Text(comments[index].comment!),
                        );*/
                      },
                    ),
                  ),
                ],

              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          controller: commentsTEC,
                          decoration: InputDecoration(
                            hintText: 'Type something...',
                            hintStyle: TextStyle(color: Colors.white70),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          print("i am preseed");

                              if(commentsTEC.text.isNotEmpty)
                                {
                                  await uploadComment(
                                    currentUserId(),
                                    commentsTEC.text,
                                    widget.post!.id!,
                                    widget.post!.ownerId!,
                                    widget.post!.mediaUrl!,
                                  );
                                }

                                commentsTEC.clear();



                        },
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),



          ],
        ),
      ),


      /*
      Container(
        height: MediaQuery.of(context).size.height,
        child:
        // Center(
        //   child: Container(
        //     child: Text("no comment",style: TextStyle(color: Colors.white),),
        //   ),
        // )
        //

        Flex(
          direction: Axis.vertical,
          children: [

            Flexible(
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: buildFullPost(),
                  ),
                  Divider(thickness: 1.5),

/*

                  Flexible(
                    child: buildComments(),
                  )

*/

                ],
              ),
            ),
/*
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  constraints: BoxConstraints(
                    maxHeight: 190.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: TextField(
                            textCapitalization: TextCapitalization.sentences,
                            controller: commentsTEC,
                            style: TextStyle(
                              fontSize: 15.0,
                              color:
                              Theme.of(context).textTheme.headline6!.color,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color:
                                  Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color:
                                  Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color:
                                  Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                  Theme.of(context).colorScheme.secondary,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              hintText: "Write your comment...",
                              hintStyle: TextStyle(
                                fontSize: 15.0,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .color,
                              ),
                            ),
                            maxLines: null,
                          ),
                          trailing: GestureDetector(
                            onTap: () async {

                              /*
                              await services.uploadComment(
                                currentUserId(),
                                commentsTEC.text,
                                widget.post!.postId!,
                                widget.post!.ownerId!,
                                widget.post!.mediaUrl!,
                              );
                              commentsTEC.clear();

                              */
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Icon(
                                Icons.send,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
*/

          ],
        ),


      ),

       */
    );
  }


  uploadComment(String currentUserId, String comment, String postId, String ownerId, String mediaUrl) async {
    //DocumentSnapshot doc = await usersRef.doc(currentUserId).get();
   //UserJsonModel userr = UserJsonModel.fromJson(doc.data() as Map<String, dynamic>);
    //RawConversionModel().UserJsonToUser(userr);
    user = LoginCredentials().loggedInUser;
    await commentRef.doc(postId).collection("comments").add({
      "username": user!.userName,
      "comment": comment,
      "timestamp": Timestamp.now(),
      "userDp": user!.photoUrl,
      "userId": user!.id,
    });
    bool isNotMe = ownerId != currentUserId;
    if (isNotMe) {
/*      addCommentToNotification("comment", comment, user!.username!, user!.id!,
          postId, mediaUrl, ownerId, user!.photoUrl!);*/
    }
  }



  buildFullPost() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200.0,
            width: MediaQuery.of(context).size.width - 20.0,
            child: cachedNetworkImage(widget.post!.mediaUrl!),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.post!.description!,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Text(

                        widget.post?.timestamp ?? ""
                        //nullableString ?? ""
                        // widget.post?.timestamp== null?
                        //     "8:10" :  widget.post?.timestamp ?? ""
                        ,
                        // timeago.format(widget.post!.timestamp!.toDate()),
                        style: TextStyle(),
                      ),
                      SizedBox(width: 3.0),

                    ],
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  buildLikeButton(),
                  SizedBox(width: 10,),
                  StreamBuilder(
                    stream: likesRef
                        .where('postId', isEqualTo: widget.post!.id)
                        .snapshots(),
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        QuerySnapshot snap = snapshot.data!;
                        List<DocumentSnapshot> docs = snap.docs;
                        return buildLikesCount(context, docs.length ?? 0);
                      } else {
                        return buildLikesCount(context, 0);
                      }
                    },
                  ),
                ],
              ),

            ],
          ),
        ),
      ],
    );
  }
/*

  buildComments() {
    return CommentsStreamWrapper(
      shrinkWrap: true,
      // padding: const EdgeInsets.symmetric(horizontal: 20.0),
      stream: commentRef.doc(widget.post!.postId).collection('comments').orderBy('timestamp', descending: true).snapshots(),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, DocumentSnapshot snapshot) {
        CommentModel comments = CommentModel.fromJson(snapshot.data() as Map<String, dynamic>);
        // return Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     ListTile(
        //       contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
        //       leading: CircleAvatar(
        //         radius: 20.0,
        //         backgroundImage: NetworkImage(comments.userDp!),
        //       ),
        //       title: Text(
        //         comments.username!,
        //         style: TextStyle(fontWeight: FontWeight.w700),
        //       ),
        //       subtitle: Text(
        //         timeago.format(comments.timestamp!.toDate()),
        //         style: TextStyle(fontSize: 12.0),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //       child: Text(
        //         comments.comment!,
        //         style: TextStyle(fontWeight: FontWeight.w400),
        //       ),
        //     ),
        //     Divider()
        //   ],
        // );
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: CachedNetworkImageProvider(comments.userDp!),
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comments.username!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        timeago.format(comments.timestamp!.toDate()),
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Text( comments.comment!.trim()),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        );
      },
    );
  }
*/

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
          //
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
                dotLastColor: Color(0xffff8c00)),
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

  buildLikesCount(BuildContext context, int count) {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0),
      child: Text(
        '$count likes',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10.0,
        ),
      ),
    );
  }

  addLikesToNotification() async {
    bool isNotMe = currentUserId() != widget.post!.ownerId;

    if (isNotMe) {
      DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
      UserJsonModel userr = UserJsonModel.fromJson(doc.data() as Map<String, dynamic>);

      user = RawConversionModel().UserJsonToUser(userr);
      notificationRef
          .doc(widget.post!.ownerId)
          .collection('notifications')
          .doc(widget.post!.postId)
          .set({
        "type": "like",
        "username": user!.userName!,
        "userId": currentUserId(),
        "userDp": user!.photoUrl!,
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
      UserJsonModel userr = UserJsonModel.fromJson(doc.data() as Map<String, dynamic>);
      user = RawConversionModel().UserJsonToUser(userr);

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
}
