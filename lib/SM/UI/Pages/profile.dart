
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
  final user;

  Profile({this.user});

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
  //  checkIfFollowing();

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

  Future<void> _refreshData() async {

    user = await SpecificWant().getUserByIdfromFb(user!.id);
    setState((){
          print(user?.userName);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child: ProfileAppBar()),

      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: CustomScrollView(
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
                         PostGrid( profileId: widget.user.id,email: widget.user.email),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      /*
      floatingActionButton: FloatingActionButton(onPressed: () async {

        User user = SpecificWant().specificUser(widget.profileId);
        print(user.userName);



      },),

    */

    );
  }



}
