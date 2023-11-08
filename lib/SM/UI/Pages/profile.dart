
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhabiansomachar/SM/JSON_Management/FacadeJson/FacadeJson.dart';
import 'package:dhabiansomachar/SM/JSON_Management/model/PostJsonModel.dart';
import 'package:dhabiansomachar/SM/ModelClass/LoginCredential.dart';
import 'package:dhabiansomachar/SM/ModelClass/Post.dart';
import 'package:dhabiansomachar/SM/ModelClass/User.dart';
import 'package:dhabiansomachar/SM/UI/Components/Profile/AppBAr.dart';
import 'package:dhabiansomachar/SM/UI/Components/Profile/FollowOrSetting.dart';
import 'package:dhabiansomachar/SM/UI/Components/Profile/GridPost.dart';
import 'package:dhabiansomachar/SM/UI/Components/Profile/MiddleBoard.dart';
import 'package:dhabiansomachar/SM/UI/Components/Profile/ProfileInfo.dart';
import 'package:dhabiansomachar/SM/UI/Components/Profile/ProfilePhoto.dart';
import 'package:dhabiansomachar/SM/UI/Components/Profile/TopBoard.dart';
import 'package:dhabiansomachar/SM/UI/Components/Profile/UpperPortion.dart';
import 'package:dhabiansomachar/SM/UI/Components/Profile/UserActivities.dart';
import 'package:dhabiansomachar/SM/UI/Components/Profile/UserBio.dart';
import 'package:dhabiansomachar/SM/Utilites/Helper/Singleton/PostList.dart';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../Utilites/Constants/firebase.dart';
import '../../Utilites/Helper/SpecificWant.dart';
import '../Components/ProfilePage/GridWrapper.dart';
import '../Components/ProfilePage/PostTile.dart';
import 'AllPostView.dart';


class Profile extends StatefulWidget {
  final profileId;
  final email;


  Profile({this.profileId, this.email});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {



  User? user;
  bool isLoading = true;
  int postCount = 0;
  int followersCount = 0;
  int followingCount = 0;
  bool isFollowing = false;
 // UserModel? users;
  late User users;

  late User PossessedUser;
  final DateTime timestamp = DateTime.now();
  ScrollController controller = ScrollController();

   List<Post> filteredlist =[];


  currentUserId() {
    return firebaseAuth.currentUser?.uid;
  }

  @override
  void initState() {
    super.initState();
    checkIfFollowing();

    if(widget.profileId == LoginCredentials().loggedInUser?.id)
      {
        user = LoginCredentials().loggedInUser!;
      }
    else
      {
           user = SpecificWant().specificUser(widget.profileId);
      }

   // fetchMypost();
  }

  checkIfFollowing() async {
    DocumentSnapshot doc = await followersRef
        .doc(widget.profileId)
        .collection('userFollowers')
        .doc(currentUserId())
        .get();
    setState(() {
      isFollowing = doc.exists;
    });
  }
  //int ind = UserModel.getUserIndex(firebaseAuth.currentUser!.email ?? "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child: ProfileAppBar()),

      body: CustomScrollView(
        slivers: <Widget>[
          TopBoard(user: user,),
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                if (index > 0) return null;
                return Container(
                  color: Colors.grey,
                  child: Column(
                    children: [
                       MiddleBoard(user: user,),
                      PostGrid( profileId: widget.profileId,email: widget.email),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
      /*
      floatingActionButton: FloatingActionButton(onPressed: () async {

        User user = SpecificWant().specificUser(widget.profileId);
        print(user.userName);



      },),

    */

    );
  }

  buildCount(String label, int count) {
    return Column(
      children: <Widget>[
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w900,
            fontFamily: 'Ubuntu-Regular',
          ),
        ),
        SizedBox(height: 3.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            fontFamily: 'Ubuntu-Regular',
          ),
        )
      ],
    );
  }
/*
  buildProfileButton(user) {
    //if isMe then display "edit profile"
    bool isMe = widget.profileId == firebaseAuth.currentUser!.uid;
    if (isMe) {
      return buildButton(
          text: "Edit Profile",
          function: () {
/*            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (_) => EditProfile(
                  user: user,
                ),
              ),
            );*/
          });
      //if you are already following the user then "unfollow"
    } else if (isFollowing) {
      return buildButton(
        text: "Unfollow",
        function: handleUnfollow,
      );
      //if you are not following the user then "follow"
    } else if (!isFollowing) {
      return buildButton(
        text: "Follow",
        function: handleFollow,
      );
    }
  }
*/
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
/*
  handleUnfollow() async {
    DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
    users = UserModel.fromJson(doc.data() as Map<String, dynamic>);
    setState(() {
      isFollowing = false;
    });
    //remove follower
    followersRef
        .doc(widget.profileId)
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
        .doc(widget.profileId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    //remove from notifications feeds
    notificationRef
        .doc(widget.profileId)
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
    DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
    users = UserModel.fromJson(doc.data() as Map<String, dynamic>);
    setState(() {
      isFollowing = true;
    });
    //updates the followers collection of the followed user
    followersRef
        .doc(widget.profileId)
        .collection('userFollowers')
        .doc(currentUserId())
        .set({});
    //updates the following collection of the currentUser
    followingRef
        .doc(currentUserId())
        .collection('userFollowing')
        .doc(widget.profileId)
        .set({});
    //update the notification feeds
    notificationRef
        .doc(widget.profileId)
        .collection('notifications')
        .doc(currentUserId())
        .set({
      "type": "follow",
      "ownerId": widget.profileId,
      "username": users?.username,
      "userId": users?.id,
      "userDp": users?.photoUrl,
      "timestamp": timestamp,
    });
  }
*/

  buildLikeButton() {
    return StreamBuilder(
      stream: favUsersRef
          .where('postId', isEqualTo: widget.profileId)
          .where('userId', isEqualTo: currentUserId())
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          List<QueryDocumentSnapshot> docs = snapshot.data?.docs ?? [];
          return GestureDetector(
            onTap: () {
              if (docs.isEmpty) {
                favUsersRef.add({
                  'userId': currentUserId(),
                  'postId': widget.profileId,
                  'dateCreated': Timestamp.now(),
                });
              } else {
                favUsersRef.doc(docs[0].id).delete();
              }
            },
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0,
                  )
                ],
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(3.0),
                child: Icon(
                  docs.isEmpty
                      ? CupertinoIcons.heart
                      : CupertinoIcons.heart_fill,
                  color: Colors.red,
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

}
