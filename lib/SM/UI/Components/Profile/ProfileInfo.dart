import 'package:flutter/cupertino.dart';

class ProfileInfo extends StatefulWidget {

   final user;
   ProfileInfo({this.user});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Container(
          width: 130.0,
          child: Text(
            widget.user!.userName!,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w900,
            ),
            maxLines: null,
          ),
        ),
        Container(
          width: 130.0,
          child: Text(
            widget.user!.country!,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 10.0),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              widget.user!.email!,
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
