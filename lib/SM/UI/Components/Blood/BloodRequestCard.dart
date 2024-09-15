import 'package:flutter/material.dart';
class BloodRequestCard extends StatelessWidget {
  final String name;
  final String bloodGroup;
  final String location;
  final String contact;

  const BloodRequestCard({
    Key? key,
    required this.name,
    required this.bloodGroup,
    required this.location,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Blood Group: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(bloodGroup),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Location: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(location),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Contact: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(contact),
              ],
            ),
          ],
        ),
      ),
    );
  }
}