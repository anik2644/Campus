import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Firebase Data Loading Example'),
        ),
        body: Center(
          child: FirebaseData(),
        ),
    );
  }
}

class FirebaseData extends StatefulWidget {
  @override
  _FirebaseDataState createState() => _FirebaseDataState();
}

class _FirebaseDataState extends State<FirebaseData> {
  bool isLoading = true;
  List<String> items = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // Simulate an async operation to fetch data from Firestore
    await Future.delayed(Duration(seconds: 2));

    // Replace with your Firestore data fetching logic
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('your_collection').get();

    List<String> data = [];
    querySnapshot.docs.forEach((doc) {
      data.add(doc.get('field_name'));
    });

    setState(() {
      items = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: isLoading,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        Visibility(
          visible: !isLoading,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
