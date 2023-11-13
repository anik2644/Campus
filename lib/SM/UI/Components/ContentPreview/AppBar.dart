import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentAppBAr extends StatefulWidget {
  const ContentAppBAr({super.key});

  @override
  State<ContentAppBAr> createState() => _ContentAppBArState();
}

class _ContentAppBArState extends State<ContentAppBAr> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue, // Set your desired background color
      elevation: 0, // Remove the elevation for a flat design
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white), // Back button icon
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Your functionality here
            // SentAllImageTOFireStorage();
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Card(
            elevation: 8.0, // Adjust the elevation as needed
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Post',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 17),
                  ),
                  SizedBox(width: 8.0), // Add some spacing between icon and text
                  Icon(
                    Icons.send, // Replace with your desired icon
                    color: Colors.blueAccent, // Set the icon color
                  ),
                ],
              ),
            ),
          ),

        ),

      ],
      title: Text(
        'Content Preview',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
