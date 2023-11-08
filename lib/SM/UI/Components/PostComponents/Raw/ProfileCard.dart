import 'package:dhabiansomachar/SM/JSON_Management/JSONFile.dart';
import 'package:dhabiansomachar/SM/UI/Widgets/indicators.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../ModelClass/Post.dart';
import '../../../../ModelClass/User.dart';
import '../../../../Utilites/Constants/firebase.dart';
import '../../../Pages/profile.dart';


class ProfileCard extends StatefulWidget {

  final Post? post;
  ProfileCard(this.post);


  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {


 // late User postUser;
  bool isLoading =true;

  // Future<User> findUser(String? ownerId) async {
  //   JSONFile jf = JSONFile("users");
  //   List<Object> li = await jf.read();
  //   List<User> users = li as List<User>;
  //
  //   //print("now to find");
  //   int ind  = await users.indexWhere((item) => item.email == ownerId);
  //   postUser = ind==-1? users[0] : users[ind];
  //
  //  // print(postUser.userName);
  //
  //   return postUser;
  //
  // }

  @override
  void initState() {
    // //findUser(widget.post?.ownerEmail).then((user) {
    //   setState(() {
    //   //  postUser = user;
    //     isLoading = false;
    //   });
    // });

    isLoading = false;
    super.initState();
  }


  buildUser(BuildContext context, Post? post) {
    bool isMe = false;//currentUserId() == post!.ownerId;
    return Visibility(
      visible: !isMe,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: GestureDetector(
             onTap: () => showProfile(context, profileId: post?.ownerId!),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  post?.ownerPhotoUrl == ""
                      ? CircleAvatar(
                    radius: 20.0,
                    backgroundColor:
                    Theme.of(context).colorScheme.secondary,
                    child: Center(
                      child: Text(
                        '${post?.ownerId.toString().toUpperCase()}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  )
                      : CircleAvatar(
                    radius: 20.0,
                    backgroundImage: CachedNetworkImageProvider(
                      '${post?.ownerPhotoUrl}',
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${post?.userName ?? ""}',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${post?.ownerEmail ?? ""}',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Color(0xff4D4D4D),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  showProfile(BuildContext context, {String? profileId}) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (_) => Profile(profileId: profileId),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return isLoading? CircularProgressIndicator(): buildUser(context, widget.post);
  }
}
