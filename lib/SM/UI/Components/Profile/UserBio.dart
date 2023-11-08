import 'package:flutter/cupertino.dart';

class UserBio extends StatefulWidget {
  final user;
  UserBio({this.user});


  @override
  State<UserBio> createState() => _UserBioState();
}

class _UserBioState extends State<UserBio> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 20.0),
      child: widget.user!.bio!.isEmpty
          ? Container()
          : Container(
        width: 200,
        child: Text(
          widget.user!.bio!,
          style: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w600,
          ),
          maxLines: null,
        ),
      ),
    );
  }
}
