import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget AddPopUp(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(16),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.transparent, // White background
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          buildOption(context, Icons.edit, 'Add Post', 'Add a new post', () {
            Navigator.pop(context);
            // Add your logic here for "Add Post"
            print('Add Post pressed');
          }),
          SizedBox(height: 16), // Add some gap between buttons
        //  buildDivider(),
          SizedBox(height: 16), // Add some gap between buttons
          buildOption(
              context, Icons.insert_drive_file, 'Add Content', 'Add new content',
                  () {
                Navigator.pop(context);
                // Add your logic here for "Add Content"
                print('Add Content pressed');
              }),
        ],
      ),
    ),
  );
}

Widget buildOption(
    BuildContext context, IconData icon, String title, String description,
    VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      //color: Colors.white,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Increased border radius for rounded corners
        border: Border.all(color: Colors.blueAccent,width: 6.0,), // Added black border
        color: Colors.white, // White background
      ),
      child: Row(
        children: <Widget>[
          Container(

            decoration: BoxDecoration(
              color: Colors.blue, // Blue color for the icon background
              shape: BoxShape.circle,
              //color: Colors.transparent,
            ),
            padding: EdgeInsets.all(8),
            child: Icon(icon, size: 32, color: Colors.white), // White icon color
          ),
          SizedBox(width: 16),
          Column(
            //color: Colors.transparent,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: TextStyle(fontSize: 18, color: Colors.black)),
              SizedBox(height: 4),
              Text(description, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    ),
  );
}


Widget buildDivider() {
  return Container(
    height: 1,
    color: Colors.grey,
    margin: EdgeInsets.symmetric(vertical: 8),
  );
}
