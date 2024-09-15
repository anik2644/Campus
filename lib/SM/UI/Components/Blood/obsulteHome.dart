import 'package:flutter/material.dart';



class BloodDonationHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(''),
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.notifications),
        ],
      ),
      body: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.blue,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.blue),
              ),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Sifat Ullah Shah',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    '+923201234567',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Text(
                'You are available to donate blood',
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Switch(
                value: true,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'جس نے کسی ایک انسان کی جان بچائی تو گویا اس نے تمام انسانوں کی جان بچائی۔ القران ۵:۳۲',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Expanded(
          child: GridView.count(
            padding: EdgeInsets.all(16.0),
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            children: <Widget>[
              Card(
                child: InkWell(
                  onTap: () {},
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.search, size: 50, color: Colors.red),
                        Text('Search Blood Donor'),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  onTap: () {},
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.favorite, size: 50, color: Colors.red),
                        Text('Thalassemia Patient'),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  onTap: () {},
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.bloodtype, size: 50, color: Colors.red),
                        Text('Blood Request'),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  onTap: () {},
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.person, size: 50, color: Colors.red),
                        Text('My Request'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
