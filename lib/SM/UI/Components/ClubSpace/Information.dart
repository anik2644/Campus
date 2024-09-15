import 'package:flutter/material.dart';

import 'Committee.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TNMA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Information(),
    );
  }
}

class Information extends StatefulWidget {
  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About TNMA'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TnmaGoalsPage()),
                        );
                      },
                      child: Text('TNMA Goals'),
                    ),
                    SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ExecutiveCommitteePage()),
                        );
                      },
                      child: Text('Executive Committee'),
                    ),
                    SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GalleryPage()),
                        );
                      },
                      child: Text('Gallery'),
                    ),
                    // Add more buttons as needed
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Image.network('https://via.placeholder.com/350x150'),
              SizedBox(height: 16.0),
              Text(
                'TNMA was established on September 30, 2018 by a group of doctors and dentists to be able to run the free health camp more efficiently and on a more regular basis. Previously TNMA physicians have been running a free health camp in collaboration with The Nepalese Society of Texas (NST) since 2009. The long term goal of TNMA is to establish a free medical and dental clinic for the Nepalese community...',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TnmaGoalsPage()),
                  );
                },
                child: Text(
                  'Read More on TNMA and its Goals',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://via.placeholder.com/100'),
                ),
                title: Text('Sanjeeb Shrestha, MD, FACG'),
                subtitle: Text('President, TNMA\nFort Worth, Texas'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PresidentMessagePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TnmaGoalsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TNMA Goals'),
      ),
      body: Center(
        child: Text('TNMA Goals Page Content'),
      ),
    );
  }
}



class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: Center(
        child: Text('Gallery Page Content'),
      ),
    );
  }
}

class PresidentMessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('President Message'),
      ),
      body: Center(
        child: Text('President Message Page Content'),
      ),
    );
  }
}
