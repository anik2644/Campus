import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            //buildProfileButton(user),
          ],
        ),
      ),
    );
  }
}
