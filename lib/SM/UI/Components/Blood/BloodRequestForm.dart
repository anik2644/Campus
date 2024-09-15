import 'package:flutter/material.dart';


class BloodRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REQUEST BLOOD'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: RequestBloodForm(),
    );
  }
}

class RequestBloodForm extends StatefulWidget {
  @override
  _RequestBloodFormState createState() => _RequestBloodFormState();
}

class _RequestBloodFormState extends State<RequestBloodForm> {
  bool isSelf = true;
  String gender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: const Text('Self'),
                  leading: Radio<bool>(
                    value: true,
                    groupValue: isSelf,
                    onChanged: (bool? value) {
                      setState(() {
                        isSelf = value!;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text('Other'),
                  leading: Radio<bool>(
                    value: false,
                    groupValue: isSelf,
                    onChanged: (bool? value) {
                      setState(() {
                        isSelf = value!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'First Name',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Last Name',
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'MM',
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'DD',
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'YYYY',
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: const Text('Male'),
                  leading: Radio<String>(
                    value: 'Male',
                    groupValue: gender,
                    onChanged: (String? value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text('Female'),
                  leading: Radio<String>(
                    value: 'Female',
                    groupValue: gender,
                    onChanged: (String? value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Blood Group',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Address',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Mobile Number',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Place to Donate (City, State, Hospital, Other address etc.)',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Message to Donor',
            ),
          ),
        ],
      ),
    );
  }
}
