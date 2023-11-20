import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About App', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black, // Set title bar color to black
        centerTitle: true, // Center the title text
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 60.0,
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/premium-vector/curzon-hall-vector-artwork-dhaka-university_851451-8.jpg?w=740'),
              ),
              SizedBox(height: 16.0),
              Text(
                'ঢাবিয়ান সমাচার: Your Daily Dose of Dhaka University News',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              Text(
                'Discover, Connect, and Stay Informed!',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star_border,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Connect with your university community, share your thoughts, and stay updated with the latest news. ঢাবিয়ান সমাচার brings you closer!',
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.0), // Double space
              _buildFeatureWidget(Icons.check_circle, 'Real-time News Updates'),
              SizedBox(height: 32.0), // Double space
              _buildFeatureWidget(Icons.people, 'Community Interaction'),
              SizedBox(height: 32.0), // Double space
              _buildFeatureWidget(Icons.chat_bubble, 'Instant Messaging'),
              SizedBox(height: 32.0), // Double space
              _buildFeatureWidget(Icons.add_box, 'Create and Share Content'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureWidget(IconData icon, String text) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blue,
        ),
        SizedBox(width: 8.0),
        Flexible(
          child: Text(
            text,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AboutAppPage(),
    debugShowCheckedModeBanner: false,
  ));
}
