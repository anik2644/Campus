import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../ModelClass/Post.dart';
import '../../Pages/PostComment.dart';
class PostAppBar extends StatefulWidget {
  final Post post;
  const PostAppBar({required this.post});


  @override
  State<PostAppBar> createState() => _PostAppBarState();
}

class _PostAppBarState extends State<PostAppBar> {
  @override
  Widget build(BuildContext context) {
    return  AppBar(
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
      )

      /*    .animate(

        //delay: 1000.ms, // this delay only happens once at the very start
        onPlay: (controller) => controller.repeat(), // loop
      ).fadeIn(duration: 1500.ms).fadeOut(delay: 3500.ms, duration: 200.ms) // runs after fade.),*/
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
    );
  }
}
