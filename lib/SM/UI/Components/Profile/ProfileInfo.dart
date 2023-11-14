import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          child: Center(
            child: Text(
              widget.user!.userName!,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w900,
              ),
             // maxLines: null,
            ),
          ),
        ),
        SizedBox(height: 5.0),
        Row(
          children: [
            SizedBox(width: 4.0),
            Icon(
              Icons.mail,
              size: 12.0,
              color: Colors.black45,
            ),
            SizedBox(width: 2.0),
            Container(
              width: 130.0,
              child: Text(
                '${widget.user!.email!.toLowerCase()}',
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.black45,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(height: 5.0),
        Row(
          children: [
            SizedBox(width: 4.0),
            Icon(
              // Your relevant icon
              Icons.location_on,
              size: 16.0,
              color: Colors.grey,
            ),
            SizedBox(width: 4.0), // Adjust the width based on your preference
            Container(
              width: 130.0,
              child: Text(
                '${widget.user!.country!.split(',')[0].trim()[0].toUpperCase()}${widget.user!.country!.split(',')[0].trim().substring(1).toLowerCase()}',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
       // SizedBox(width: 10.0),


      ],
    );
  }
}
