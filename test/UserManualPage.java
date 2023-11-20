import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: UserManualPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class UserManualPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Manual'),
        backgroundColor: Colors.black, // Black app bar
        centerTitle: true, // Center the title text
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 70.0,
                backgroundImage: NetworkImage(
                  'https://img.freepik.com/premium-vector/curzon-hall-vector-artwork-dhaka-university_851451-8.jpg?w=740',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Hello People! Welcome To This Ultimate User Guide Of Our App',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'ঢাবিয়ান সমাচার is like your online hangout space at Dhaka University. '
                    'It\'s where you connect, share, and stay updated with what\'s happening around you.',
              ),
            ),
            _buildSectionCard(
              title: 'Let\'s Get Started',
              description:
              'Installation:\n1. Download ঢাবিয়ান সমাচার: Find its APK file and download it.\n2. Install the App: Put it on your device.',
              imageUrl: 'https://drive.google.com/uc?export=view&id=1Fgi8_d7HMVQa1RHI5AN-Yy36WmbGBSrn',
            ),
            _buildSectionCard(
              title: 'Account Creation',
              description:
              '1. Sign Up: Open the app and click on "Sign Up." Fill in the required information. Click the signup button.\n'
                  '2. Already a Member? Login: Use your details to get in.',
              imageUrl: 'https://drive.google.com/uc?export=view&id=1LRmg2GMf0C2VaU88R5KMpVYLYn3Mh17f',
            ),
            _buildSectionCard(
              title: 'Your Main Hub',
              description:
              'App Bar: The top part of your screen with buttons.\n'
                  'Profile Picture: Your profile picture icon is shown at the top right corner.\n'
                  'Home Symbol (News Feed): Click to see what\'s happening.\n'
                  'News Symbol (Content Page): Explore all the cool posts.',
              imageUrl: 'https://drive.google.com/uc?export=view&id=1YZVnDyM3DK0HPTtuKd-39HMh8itC5s90',
            ),
            _buildSectionCard(
              title: 'Let\'s Do Stuff',
              description:
              'Making a Post:\n1. Click the Plus Sign: It\'s to make a new post.\n'
                  '2. Add a Picture and Words: Put in a cool picture and write something.\n'
                  '3. Submit to Post: Share it with everyone.',
              imageUrl: 'https://drive.google.com/uc?export=view&id=1xPDPqoC3pPDgaiEngx1SHcqCA-iiGPq1',
            ),
            _buildSectionCard(
              title: 'Interacting with Posts',
              description:
              'Like: Tap the heart if you like something.\n'
                  'Comment: Talk to others using comments.\n'
                  'Follow: Connect with others by following them.',
              imageUrl: 'https://drive.google.com/uc?export=view&id=1R0Q8N-3fsmFvkfZ3DX_6FHAg4PHNpELx',
            ),
            _buildSectionCard(
              title: 'Searching Users',
              description: 'Find your friends with the search.',
              imageUrl: 'https://drive.google.com/uc?export=view&id=1o0xn-ya_c7zvwn4VaFm75hlSUfKN3mnU',
            ),
            _buildSectionCard(
              title: 'Chatting with Users',
              description: 'Use the "Messages" section to chat.',
              imageUrl: 'https://drive.google.com/uc?export=view&id=1bfgUM9QotY0phpsiGBkIPnoI2S_2P8RV',
            ),
            _buildSectionCard(
              title: 'Content Creation',
              description:
              'Creating a Content:\n1. Adding Text: Write a cool title and some text.\n'
                  '2. Adding Pictures: Drag and drop pictures to make it awesome.\n'
                  '3. Posting Content: Share it with everyone.',
              imageUrl: 'https://drive.google.com/uc?export=view&id=1kmMSt6r6fitwSMT_UpUTFXs7UASva4Oe',
            ),
            _buildSectionCard(
              title: 'Accessing Content Page',
              description: 'Click on the news symbol to see all the posts.',
              imageUrl: 'https://drive.google.com/uc?export=view&id=18xZliEIq6ytHGadaOgUoqn6I-u2MEPnU',
            ),
            _buildSectionCard(
              title: 'Fun and Ads',
              description: 'Ad Promotion: Explore cool promotions in the middle of your screen.',
              imageUrl: 'https://drive.google.com/uc?export=view&id=1kA0D-EshU0aKKCpZMSCPHE0SjR6X8T5t',
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({required String title, required String description, required String imageUrl}) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(description),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              imageUrl,
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
