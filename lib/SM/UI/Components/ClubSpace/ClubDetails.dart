import 'package:dhabiansomachar/SM/UI/Components/ClubSpace/Committee.dart';
import 'package:dhabiansomachar/SM/UI/Components/ClubSpace/Information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';




class ClubDetails extends StatefulWidget {
  @override
  State<ClubDetails> createState() => _ClubDetailsState();
}

class _ClubDetailsState extends State<ClubDetails> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
       // ptional: Add a title if needed
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Slider
              Stack(
                children: [
                  CarouselSlider(
                    items: [
                      CachedNetworkImage(
                        imageUrl: 'https://www.dumuna.info/wp-content/uploads/2020/08/DUMUNA-LOGO-3.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      CachedNetworkImage(
                        imageUrl: 'https://cdn.statically.io/img/www.dumuna.info/f=auto/wp-content/uploads/2020/10/183.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      CachedNetworkImage(
                        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNHvEiI1SEXkjBOgiBWIyPhMwCR49P4mI4fmSyYSGuSltaY2A_o40OV0RRpayGOeGoIPk&usqp=CAU',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ],
                    options: CarouselOptions(
                      height: 250,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [0, 1, 2].map((index) {
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index ? Colors.white : Colors.grey,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ThreeButtons(),
              SizedBox(height: 16),
              TNMAHighlights(),
              // Title Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dhaka University Debating Society',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Ambidextrous in Reasoning, Inexhaustible in Consciousness',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              // Description Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'The Dhaka University Debating Society (DUTS) is renowned for fostering critical thinking and public speaking skills among students. Join us for regular debates, workshops, and national and international competitions. Engage with a community dedicated to the art of debate.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 16),
              // Custom Widget
            ],
          ),
        ),
      ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.event),
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.explore),
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {
                  setState(() {
                    _currentIndex = 3;
                  });
                },
              ),
            ],
          ),
        ),
    );
  }
}


class ThreeButtons extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => ExecutiveCommitteePage(),
                  ),
                );
              },
              child: Text('Committee'),
            ),
            ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) =>Information(),
                  ),
                );
                // Handle Description button press
              },
              child: Text('Description'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle Events button press
              },
              child: Text('Events'),
            ),
          ],
        ),
      ),
    )
    ;
  }
}

class WeatherInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dallas TX', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Mostly Sunny', style: TextStyle(fontSize: 16)),
          ],
        ),
        Column(
          children: [
            Text('86°F', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            Icon(Icons.wb_sunny, size: 40),
          ],
        ),
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CachedNetworkImage(
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoyvNNmBxIJN0r6zHajd1wxmiGaDZUsOBwOw&s', // Replace with your image URL
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ), // Replace with your image URL
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ঢাকা ইউনিভার্সিটি ডিবেটিং সোসাইটি', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('Ambidextrous in Reasoning, Inexhaustible in Consciousness ', style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class TNMAHighlights extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(child: Text('Duts Highlights', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
          ),
          SizedBox(height: 8),
          HighlightCard(
            title: 'Debate Camp',
            description: 'Free health camps in collaboration with Nepalese Society of Texas (NST) every other month',
            icon: Icons.health_and_safety,
          ),
          HighlightCard(
            title: 'Upcoming Events',
            description: 'We provide a social platform for the interaction and networking between the community members and healthcare professionals',
            icon: Icons.event,
          ),
          HighlightCard(
            title: 'Sponsorships',
            description: '',
            icon: Icons.spa,
          ),
        ],
      ),
    );
  }
}

class HighlightCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  HighlightCard({required this.title, required this.description, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(description, style: TextStyle(fontSize: 14)),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
