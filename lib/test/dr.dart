import 'package:flutter/material.dart';


class Drawerexample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Example'),
      ),
      drawer: Drawer(
    child: ListView(
    padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text('John Doe'),
          accountEmail: Text('johndoe@example.com'),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://example.com/images/profile.jpg',
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          otherAccountsPictures: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://example.com/images/other1.jpg',
              ),
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://example.com/images/other2.jpg',
              ),
            ),
          ],
        ),



        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            // Handle drawer item tap
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Profile'),
          onTap: () {
            // Handle drawer item tap
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            // Handle drawer item tap
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () {
            // Handle drawer item tap
            Navigator.pop(context);
          },
        ),
      ],
    ),
    ),
      body: Center(
        child: Text('Drawer Example'),
      ),
    );
  }
}
