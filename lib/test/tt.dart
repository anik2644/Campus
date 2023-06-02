import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_media_app/SM/models/user.dart';


class tmdte extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String formattedDateTime = DateFormat('EEEE, MMMM d, \nHH:mm, yyyy' ).format(now);

    return  Scaffold(
        appBar: AppBar(
          title: Text('Date and Time Example'),
        ),
        body: Center(
          child: Text(
            formattedDateTime,
            style: TextStyle(fontSize: 20),
          ),
        ),
      floatingActionButton: FloatingActionButton(onPressed: () {

        print(UserModel.getPhotourl("mhdank15865@gmail.com"));
      },),

    );
  }
}
