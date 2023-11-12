import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../ModelClass/LoginCredential.dart';
import '../../../ModelClass/User.dart';
import '../../../Utilites/Constants/firebase.dart';
import '../../../Utilites/Helper/SpecificWant.dart';
import '../../Pages/EditProfile.dart';
import 'UpperPortion.dart';
import 'UserActivities.dart';
import 'UserBio.dart';

class TopBoard extends StatefulWidget {
  final user;
  TopBoard({this.user});

  @override
  State<TopBoard> createState() => _TopBoardState();
}

class _TopBoardState extends State<TopBoard> {

  bool isFollowing = false;
  // UserModel? users;
  late User users;
  User? user;
  final DateTime timestamp = DateTime.now();
  currentUserId() {
    return firebaseAuth.currentUser?.uid;
  }

  @override
  void initState() {
    super.initState();
    checkIfFollowing();

    if(widget.user.id == LoginCredentials().loggedInUser?.id)
    {
      user = LoginCredentials().loggedInUser!;
    }
    else
    {
      user = SpecificWant().specificUserFromJson(widget.user.id);
    }

    // fetchMypost();
  }

  checkIfFollowing() async {
    DocumentSnapshot doc = await followersRef
        .doc(widget.user.id)
        .collection('userFollowers')
        .doc(currentUserId())
        .get();
    setState(() {
      isFollowing = doc.exists;
    });
  }


  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      pinned: true,
      floating: false,
      toolbarHeight: 5.0,
      collapsedHeight: 6.0,
      expandedHeight: 225.0,
      flexibleSpace: FlexibleSpaceBar(
        background:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UpperPortion(user: widget.user,),
            UserBio(user: widget.user,),
            SizedBox(height: 10.0),
            UserActivities(user: widget.user,),
            buildEditorFollowButton(widget.user),
          ],
        ),
      ),
    );
  }


  buildEditorFollowButton(user) {
    //if isMe then display "edit profile"
    bool isMe = widget.user.id == LoginCredentials().loggedInUser!.id;
    if (isMe) {
      return buildButton(
          text: "Edit Profile",
          function: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (_) => EditProfile(
                  user: user,
                ),
              ),
            );
          });
      //if you are already following the user then "unfollow"
    } else if (isFollowing) {
      return buildButton(
        text: "Unfollow",
        function: (){}, // handleUnfollow,
      );
      //if you are not following the user then "follow"
    } else if (!isFollowing) {
      return buildButton(
        text: "Follow",
        function: (){}, //handleFollow,
      );
    }
  }

  buildButton({String? text, Function()? function}) {
    return Center(
      child: GestureDetector(
        onTap: function!,
        child: Container(
          height: 40.0,
          width: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Theme.of(context).colorScheme.secondary,
                Color(0xff597FDB),
              ],
            ),
          ),
          child: Center(
            child: Text(
              text!,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  handleUnfollow() async {
    /*DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
    users = UserModel.fromJson(doc.data() as Map<String, dynamic>);*/

    users = LoginCredentials().loggedInUser!;
    setState(() {
      isFollowing = false;
    });
    //remove follower
    followersRef
        .doc(widget.user.id)
        .collection('userFollowers')
        .doc(currentUserId())
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    //remove following
    followingRef
        .doc(currentUserId())
        .collection('userFollowing')
        .doc(widget.user.id)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    //remove from notifications feeds
    notificationRef
        .doc(widget.user.id)
        .collection('notifications')
        .doc(currentUserId())
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
  }

  handleFollow() async {
    /* DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
    users = UserModel.fromJson(doc.data() as Map<String, dynamic>);
    */
    users = LoginCredentials().loggedInUser!;
    setState(() {
      isFollowing = true;
    });
    //updates the followers collection of the followed user
    followersRef
        .doc(widget.user.id)
        .collection('userFollowers')
        .doc(currentUserId())
        .set({});
    //updates the following collection of the currentUser
    followingRef
        .doc(currentUserId())
        .collection('userFollowing')
        .doc(widget.user.id)
        .set({});
    //update the notification feeds
    notificationRef
        .doc(widget.user.id)
        .collection('notifications')
        .doc(currentUserId())
        .set({
      "type": "follow",
      "ownerId": widget.user.id,
      "username": users?.userName,
      "userId": users?.id,
      "userDp": users?.photoUrl,
      "timestamp": timestamp,
    });
  }

}
