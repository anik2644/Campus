import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Container
            Container(
              // Your top container content goes here
              height: 200, // Set the height as needed
              color: Colors.blue, // Set the background color as needed
              child: Center(
                child: Text(
                  'Top Container Content',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            // Container 1
            Container(
              height: 100,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Container 1',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            // Container 2
            Container(
              height: 150,
              color: Colors.green,
              child: Center(
                child: Text(
                  'Container 2',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            // Container 3
            Container(
              height: 100,
              color: Colors.orange,
              child: Center(
                child: Text(
                  'Container 3',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            // Container 1
            Container(
              height: 100,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Container 1',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            // Container 2
            Container(
              height: 150,
              color: Colors.green,
              child: Center(
                child: Text(
                  'Container 2',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            // Container 3
            Container(
              height: 100,
              color: Colors.orange,
              child: Center(
                child: Text(
                  'Container 3',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            // Container 1
            Container(
              height: 100,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Container 1',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            // Container 2
            Container(
              height: 150,
              color: Colors.green,
              child: Center(
                child: Text(
                  'Container 2',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            // Container 3
            Container(
              height: 100,
              color: Colors.orange,
              child: Center(
                child: Text(
                  'Container 3',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            // Bottom ListView
            Container(
              height: MediaQuery.of(context).size.height - 400, // Adjust the height accordingly
              child: ListView(
                children: [
                  ListTile(title: Text('Item 1')),
                  ListTile(title: Text('Item 2')),
                  ListTile(title: Text('Item 3')),
                  ListTile(title: Text('Item 1')),
                  ListTile(title: Text('Item 2')),
                  ListTile(title: Text('Item 3')),
                  ListTile(title: Text('Item 1')),
                  ListTile(title: Text('Item 2')),
                  ListTile(title: Text('Item 3')),
                  ListTile(title: Text('Item 1')),
                  ListTile(title: Text('Item 2')),
                  ListTile(title: Text('Item 3')),
                  ListTile(title: Text('Item 2')),
                  ListTile(title: Text('Item 3')),
                  ListTile(title: Text('Item 2')),
                  ListTile(title: Text('Item 3')),



                  // Add more list items as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
