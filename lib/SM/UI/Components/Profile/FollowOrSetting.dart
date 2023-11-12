import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../ModelClass/LoginCredential.dart';
import '../../../Utilites/Constants/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Pages/Settings.dart';
class FollowOrSetting extends StatefulWidget {
  final user;
  FollowOrSetting({this.user});

  @override
  State<FollowOrSetting> createState() => _FollowOrSettingState();
}

class _FollowOrSettingState extends State<FollowOrSetting> {
  @override
  Widget build(BuildContext context) {
    return widget.user.id == LoginCredentials().loggedInUser?.id
        ? InkWell(
      onTap: () {
           Navigator.of(context).push(
             CupertinoPageRoute(
               builder: (_) => Setting(),),);
      },
      child: Column(
        children: [
          Icon(
            Ionicons.settings_outline,
            color: Theme.of(context)
                .colorScheme
                .secondary,
          ),
          Text(
            'settings',
            style: TextStyle(
              fontSize: 11.5,
            ),
          )
        ],
      ),
    )
       // : const Text('');
        : buildFollowButton();
  }



  buildFollowButton() {
    return StreamBuilder(
      stream: favUsersRef
          .where('postId', isEqualTo: widget.user.id)
          .where('userId', isEqualTo: LoginCredentials().loggedInUser!.id)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          List<QueryDocumentSnapshot> docs = snapshot.data?.docs ?? [];
          return GestureDetector(
            onTap: () {

          /*
              if (docs.isEmpty) {
                favUsersRef.add({
                  'userId': LoginCredentials().loggedInUser!.id,
                  'postId': widget.user.id,
                  'dateCreated': Timestamp.now(),
                });
              } else {
                favUsersRef.doc(docs[0].id).delete();
              }
              */
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
