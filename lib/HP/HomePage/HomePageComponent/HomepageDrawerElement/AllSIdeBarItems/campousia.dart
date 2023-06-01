import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class campousia extends StatefulWidget {
  const campousia({Key? key}) : super(key: key);

  @override
  State<campousia> createState() => _campousiaState();
}

class _campousiaState extends State<campousia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:AppBar(
       backgroundColor: Colors.black,
       title: Center(
         child: Text(
           'About App',
           style: TextStyle(color: Colors.white),
         ),
       ),
     ),
     body:Container(
       color: Colors.white,
       padding: EdgeInsets.all(16.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           Center(
             child: Text(
               'Welcome to Campusia!',
               style: TextStyle(
                 fontSize: 24.0,
                 fontWeight: FontWeight.bold,
               ),
             ),
           ),
           SizedBox(height: 16.0),
           Text(
             'Campusia is a revolutionary app designed to simplify your campus transportation experience.',
             style: TextStyle(fontSize: 18.0),
           ),
           SizedBox(height: 16.0),
           Text(
             'Key Features:',
             style: TextStyle(
               fontSize: 20.0,
               fontWeight: FontWeight.bold,
             ),
           ),
           SizedBox(height: 8.0),
           ListTile(
             leading: Icon(Icons.access_time),
             title: Text('Bus Schedules'),
             subtitle: Text('View bus schedules and timings for convenient travel planning.'),
           ),
           ListTile(
             leading: Icon(Icons.location_on),
             title: Text('Real-time Location Sharing'),
             subtitle: Text('Share your location while on the bus to keep track of your whereabouts.'),
           ),
           ListTile(
             leading: Icon(Icons.favorite),
             title: Text('Favorite Trips'),
             subtitle: Text('Save your favorite trips for quick access and easy planning.'),
           ),
           ListTile(
             leading: Icon(Icons.lock),
             title: Text('Authentication'),
             subtitle: Text('Secure access to the app\'s features with username and password authentication.'),
           ),
         ],
       ),
     ),

    );


}

}
