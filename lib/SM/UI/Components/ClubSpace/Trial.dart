import 'package:flutter/material.dart';



class BalsamicBasilChickenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Slider
            Container(
              height: 250,
              child: PageView(
                children: [
                  Image.asset('assets/image1.png', fit: BoxFit.cover),
                  Image.asset('assets/image2.png', fit: BoxFit.cover),
                  Image.asset('assets/image3.png', fit: BoxFit.cover),
                ],
              ),
            ),
            // Title Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Balsamic Basil Chicken',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$12.30',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ],
              ),
            ),
            // Description Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'This is the perfect weeknight dinner. After marinating the chicken, everything—including the veggie side!—comes together in one pan in less than 30 minutes. Call it another skillet chicken dinner win!',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            // Custom Widget
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TNMAHighlights(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.yellow,
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Checkout', style: TextStyle(fontSize: 20)),
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            onPrimary: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
    );
  }
}

class TNMAHighlights extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('TNMA Highlights', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        HighlightCard(
          title: 'Health Camp',
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
      margin: EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}
