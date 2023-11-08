import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../ModelClass/User.dart';
import '../PostComponents/view_image.dart';

class ProfilePhoto extends StatefulWidget {
  final user;
  ProfilePhoto({this.user});

  @override
  State<ProfilePhoto> createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto> {

  @override
  Widget build(BuildContext context) {
    return  Padding (
      padding: const EdgeInsets.only(left: 20.0,top: 10),
      child://UserModel.um[ind].photoUrl == null
      widget.user!.photoUrl!.isEmpty
          ? CircleAvatar(
        radius: 40.0,
        backgroundColor: Theme.of(context)
            .colorScheme
            .secondary,
        child: Center(
          child: Text(
            '${widget.user?.userName.toUpperCase()}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      )
          : CircleAvatar(
        radius: 40.0,
        backgroundImage:
        CachedNetworkImageProvider(
            widget.user!.photoUrl!
          //user.photoUrl!.isEmpty}',
        ),
      ),
    );
  }
}
