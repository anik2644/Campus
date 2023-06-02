import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Refresh Example',
      home: refPrac(),
    );
  }
}

class refPrac extends StatefulWidget {
  @override
  _refPracState createState() => _refPracState();
}

class _refPracState extends State<refPrac> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  Future<void> refreshData() async {
    // Simulate a delay before refreshing the data
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      // Update the data here
      items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Refresh Example'),
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        ),
      ),
    );
  }
}
