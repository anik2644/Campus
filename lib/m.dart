import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class add_fire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Add to Firestore Collection'),
        ),
        body: Center(
          child: AddData(),
        ),

    );
  }
}

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  void _addToFirestore() {
    String name = _nameController.text;
    int age = int.parse(_ageController.text);

    // Replace 'your_collection' with the actual name of your Firestore collection
    CollectionReference collection =
    FirebaseFirestore.instance.collection('your_collection');

    collection
        .add({
      'name': name,
      'age': age,
    })
        .then((value) => print('Data added to Firestore'))
        .catchError((error) => print('Failed to add data: $error'));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: _ageController,
            decoration: InputDecoration(labelText: 'Age'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _addToFirestore,
            child: Text('Add to Firestore'),
          ),
        ],
      ),
    );
  }
}
