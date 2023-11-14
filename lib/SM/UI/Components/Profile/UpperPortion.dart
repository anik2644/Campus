import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return  Card(
      elevation: 5.0, // Adjust the elevation as needed
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Adjust the margin as needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Adjust the border radius as needed
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfilePhoto(user: widget.user),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               // SizedBox(height: 32.0),
                Card(
                  elevation: 5.0, // Adjust the elevation as needed
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Adjust the margin as needed
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0), // Adjust the border radius as needed
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        ProfileInfo(user: widget.user),
                        // FollowOrSetting(user: widget.user),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
