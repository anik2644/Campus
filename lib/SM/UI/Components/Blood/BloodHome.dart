import 'package:dhabiansomachar/SM/UI/Components/Blood/Bloodprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AllRquestShowPage.dart';
import 'BloodRequestForm.dart';
import 'DoctorList.dart';
import 'SearchDonor.dart';


class BloodHome extends StatefulWidget {


  @override
  State<BloodHome> createState() => _BloodHomeState();
}

class _BloodHomeState extends State<BloodHome> {

  bool val = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nehad',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                Text(
                  '6 Points',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.notifications, color: Colors.black),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   padding: EdgeInsets.all(12),
              //   decoration: BoxDecoration(
              //     color: Colors.blue[100],
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              //   child: Row(
              //     children: [
              //       Text(
              //         '+2',
              //         style: TextStyle(color: Colors.blue, fontSize: 16),
              //       ),
              //       SizedBox(width: 10),
              //       Text(
              //         'Click to get extra 2 points for your daily visit',
              //         style: TextStyle(color: Colors.blue, fontSize: 12),
              //       ),
              //     ],
              //   ),
              // ),
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
                      value: val,
                      onChanged: (value) {
                        setState(() {
                          val = value;
                        });

                      },
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
              SizedBox(height: 20),
              Text(
                'Good Evening',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (_) => BloodRequest(),
                          ),
                        );


                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('I Need Blood!'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {

                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (_) =>   DoctorListPage(),
                          ),
                        );

                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Health Center'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 400, // Set a fixed height for the GridView
                child: GridView.count(
                  padding: EdgeInsets.all(16.0),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  children: <Widget>[
                    Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => FindDonorsPage(),
                            ),
                          );


                        },
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
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) =>BloodProfile(),
                            ),
                          );

                        },
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.person, size: 50, color: Colors.red),
                              Text('My Profile'),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Card(
                      child: InkWell(
                        onTap: () {

                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => DonationRequestPage(),
                            ),
                          );


                        },
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
                              Icon(Icons.favorite, size: 50, color: Colors.red),
                              Text('My Request'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Text(
              //   'For a healthy day',
              //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              // ),
              // SizedBox(height: 10),
              // Container(
              //   height: 100,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: [
              //       BannerItem(imageUrl: 'https://via.placeholder.com/150'),
              //       BannerItem(imageUrl: 'https://via.placeholder.com/150'),
              //       BannerItem(imageUrl: 'https://via.placeholder.com/150'),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'These people need blood',
              //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              //     ),
              //     TextButton(
              //       onPressed: () {},
              //       child: Text('View all'),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 10),
              // BloodRequestItem(
              //   name: 'Nehad',
              //   need: 'Whole blood',
              //   location: 'الدم الشامل للجر',
              //   bloodType: 'O-',
              // ),
              //





            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 40, color: Colors.red),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

class BannerItem extends StatelessWidget {
  final String imageUrl;

  BannerItem({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class BloodRequestItem extends StatelessWidget {
  final String name;
  final String need;
  final String location;
  final String bloodType;

  BloodRequestItem({
    required this.name,
    required this.need,
    required this.location,
    required this.bloodType,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            bloodType,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Needs: $need'),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.red),
                SizedBox(width: 4),
                Text(location),
              ],
            ),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
