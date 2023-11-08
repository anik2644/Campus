import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../Pages/AllPostView.dart';

class MiddleBoard extends StatefulWidget {
  final user;
  MiddleBoard({this.user});

  @override
  State<MiddleBoard> createState() => _MiddleBoardState();
}

class _MiddleBoardState extends State<MiddleBoard> {
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Text(
            'All Posts',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          const Spacer(),
          IconButton(
            onPressed: () async {

              // print(widget.profileId);
              // print(widget.email);
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => AllPostView(
                    userId: widget.user.id,
                    email:  widget.user.email,
                  ),
                ),
              );
            },
            icon: Icon(Ionicons.grid_outline),
          )
        ],
      ),
    );
  }
}
