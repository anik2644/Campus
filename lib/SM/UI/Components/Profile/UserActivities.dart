import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../Utilites/Constants/firebase.dart';

class UserActivities extends StatefulWidget {
  final user;
  UserActivities({this.user});

  @override
  State<UserActivities> createState() => _UserActivitiesState();
}

class _UserActivitiesState extends State<UserActivities> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            StreamBuilder(
              stream: postRef
                  .where('ownerId',
                  isEqualTo: widget.user.id)
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  QuerySnapshot<Object?>? snap =
                      snapshot.data;
                  List<DocumentSnapshot> docs = snap!.docs;
                  return buildCount(
                      "POSTS", docs.length ?? 0);
                } else {
                  return buildCount("POSTS", 0);
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: VerticalDivider(thickness: 1, color: Colors.grey),
            ),
           /* Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Container(
                height: 50.0,
                width: 0.3,
                color: Colors.grey,
              ),
            ),*/
            StreamBuilder(
              stream: followersRef
                  .doc(widget.user.id)
                  .collection('userFollowers')
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  QuerySnapshot<Object?>? snap =
                      snapshot.data;
                  List<DocumentSnapshot> docs = snap!.docs;
                  return buildCount(
                      "FOLLOWERS", docs.length ?? 0);
                } else {
                  return buildCount("FOLLOWERS", 0);
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: VerticalDivider(thickness: 1, color: Colors.grey),
            ), // Vertical line
          /*  Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Container(
                height: 50.0,
                width: 0.3,
                color: Colors.grey,
              ),
            ),*/
            StreamBuilder(
              stream: followingRef
                  .doc(widget.user.id)
                  .collection('userFollowing')
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  QuerySnapshot<Object?>? snap =
                      snapshot.data;
                  List<DocumentSnapshot> docs = snap!.docs;
                  return buildCount(
                      "FOLLOWING", docs.length ?? 0);
                } else {
                  return buildCount("FOLLOWING", 0);
                }
              },
            ),
          ],
        ),
      ),
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

}
