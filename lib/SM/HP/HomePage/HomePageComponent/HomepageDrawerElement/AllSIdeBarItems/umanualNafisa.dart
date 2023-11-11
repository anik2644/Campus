/*
Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Text(
                'Welcome to Campousia!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Here are some instructions on how to use our app:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              '1. Checking Bus Schedules:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'To check bus schedules, go to the "Schedules" section of the app and select a specific bus to view its schedule and timing.',
            ),
            SizedBox(height: 16.0),
            Text(
              '2. Sharing Location:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'To share your location, click the time button once. It will turn red at the border, indicating that your location is sharable. Clicking the button again will turn it green, indicating that your location is shared.',
            ),
            SizedBox(height: 16.0),
            Text(
              '3. Saving Favorite Trips:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              "To save your favorite trips, go to the Favorites section and select the desired trip. It will be saved for easy access in the future.",
            ),
            SizedBox(height: 16.0),
            Text(
              '4. Authentication:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              "To access the app's features, you need to enter your username and password for authentication. Only authorized users will be granted access.",
            ),
          ],
        ),
      ),
    );
 */


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserManuall extends StatefulWidget {
  const UserManuall({Key? key}) : super(key: key);

  @override
  State<UserManuall> createState() => _UserManuallState();
}

class _UserManuallState extends State<UserManuall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("User Manual"),
      ),
      body: Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Center(
            child: Text(
              'Welcome to Campousia!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Here are some instructions on how to use our app:',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 16.0),
          Text(
            '1. Checking Bus Schedules:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'To check bus schedules, go to the "Schedules" section of the app and select a specific bus to view its schedule and timing.',
          ),
          SizedBox(height: 16.0),
          Text(
            '2. Sharing Location:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'To share your location, click the time button once. It will turn red at the border, indicating that your location is sharable. Clicking the button again will turn it green, indicating that your location is shared.',
          ),
          SizedBox(height: 16.0),
          Text(
            '3. Saving Favorite Trips:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            "To save your favorite trips, go to the Favorites section and select the desired trip. It will be saved for easy access in the future.",
          ),
          SizedBox(height: 16.0),
          Text(
            '4. Authentication:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            "To access the app's features, you need to enter your username and password for authentication. Only authorized users will be granted access.",
          ),
        ],
      ),
      ),
    );
  }
}

