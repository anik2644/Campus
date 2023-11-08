import 'package:flutter/cupertino.dart';

import 'FollowOrSetting.dart';
import 'ProfileInfo.dart';
import 'ProfilePhoto.dart';

class UpperPortion extends StatefulWidget {
  final user;
  UpperPortion({this.user});

  @override
  State<UpperPortion> createState() => _UpperPortionState();
}

class _UpperPortionState extends State<UpperPortion> {
  @override
  Widget build(BuildContext context) {
    return   Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfilePhoto(user: widget.user),
        SizedBox(width: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.0),
            Row(
              children: [
                ProfileInfo(user: widget.user,),
                FollowOrSetting(user: widget.user,)

              ],
            ),
          ],
        ),
      ],
    );
  }
}
