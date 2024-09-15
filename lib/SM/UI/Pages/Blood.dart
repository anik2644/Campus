import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../Components/Blood/BloodRequestCard.dart';
import '../Components/Blood/ObsulaterRequestForm.dart';

class BloodHome extends StatefulWidget {
  @override
  State<BloodHome> createState() => _BloodHomeState();
}

class _BloodHomeState extends State<BloodHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Requests'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateBloodRequisitionPage()),
              );
              // Add functionality to create a blood requisition
            },
            tooltip: 'Create Blood Requisition',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search blood requests...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Replace with your blood request count
                itemBuilder: (context, index) {
                  return BloodRequestCard(
                    name: 'Patient $index',
                    bloodGroup: 'A+',
                    location: 'Location $index',
                    contact: 'Contact $index',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
