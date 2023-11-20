import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ঢাবিয়ান সমাচার',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          centerTitle: true,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: TermsAndConditionsPage(),
    );
  }
}

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms and Conditions',
          style: TextStyle(color: Colors.white), // White title text
        ),
        backgroundColor: Colors.black, // Black title bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      "https://img.freepik.com/premium-vector/curzon-hall-vector-artwork-dhaka-university_851451-8.jpg?w=740"),
                ),
              ),
              SizedBox(height: 16.0),
              SectionTitle('ঢাবিয়ান সমাচার - Welcome!'),
              SectionContent(
                'By accessing or using ঢাবিয়ান সমাচার, you agree to abide by these terms and conditions. If you do not agree, please refrain from using the app.',
              ),
              SectionTitle('1. User Accounts'),
              SectionContent(
                'To unleash the full potential of ঢাবিয়ান সমাচার:\n'
                    '  - Keep your login credentials secure.\n'
                    '  - Do not share your password with others.\n'
                    '  - You are responsible for all activities under your account.',
              ),
              SectionTitle('2. Content Guidelines'),
              SectionContent(
                'Express yourself responsibly:\n'
                    '  - Post, comment, and upload content in English or Bangla.\n'
                    '  - Respect others\' opinions; any harassment or inappropriate content is strictly prohibited.\n'
                    '  - The app reserves the right to remove violating content.',
              ),
              SectionTitle('3. News Portal Contributions'),
              SectionContent(
                'Share your insights through articles:\n'
                    '  - Contribute articles with images in English or Bangla.\n'
                    '  - Ensure your content adheres to ethical standards and avoids copyright infringement.',
              ),
              SectionTitle('4. User Search Feature'),
              SectionContent(
                'Connect with others:\n'
                    '  - Search for members by name, viewing their profile pictures and registered email addresses.\n'
                    '  - Use this feature responsibly, respecting others\' privacy.',
              ),
              SectionTitle('5. Privacy and Security'),
              SectionContent(
                'Your data security matters:\n'
                    '  - We prioritize the security of your data. Check our Privacy Policy for details.\n'
                    '  - Do not attempt unauthorized access or misuse of other users\' data.',
              ),
              SectionTitle('6. Updates and Modifications'),
              SectionContent(
                'Stay informed:\n'
                    '  - Terms and conditions may be updated periodically. It\'s your responsibility to stay informed.\n'
                    '  - Continued app use after modifications implies acceptance of the updated terms.',
              ),
              SectionTitle('7. Termination'),
              SectionContent(
                'Our commitment to a safe community:\n'
                    '  - ঢাবিয়ান সমাচার reserves the right to terminate or suspend user accounts for violation of terms.',
              ),
              SectionContent(
                'By using ঢাবিয়ান সমাচার, you acknowledge that you have read, understood, and agree to these terms and conditions. Thank you for being a part of our vibrant community!',
              ),
              SizedBox(height: 16.0),
              Divider(color: Colors.black),
              SizedBox(height: 16.0),
              SectionContent(
                'For any issues or concerns, please contact us at:',
                style: TextStyle(color: Colors.black),
              ),
              Row(
                children: [
                  Icon(Icons.email, color: Colors.black),
                  SizedBox(width: 8.0),
                  SectionContent(
                    'nafisa12345643@gmail.com',
                    style: TextStyle(color: Colors.black, decoration: TextDecoration.underline),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.email, color: Colors.black),
                  SizedBox(width: 8.0),
                  SectionContent(
                    'anik11556@gmail.com',
                    style: TextStyle(color: Colors.black, decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.lightBlue,
        ),
      ),
    );
  }
}

class SectionContent extends StatelessWidget {
  final String content;
  final TextStyle? style;

  SectionContent(this.content, {this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        content,
        style: style ?? TextStyle(
          fontSize: 16.0,
          color: Colors.black, // Black text color
        ),
      ),
    );
  }
}
