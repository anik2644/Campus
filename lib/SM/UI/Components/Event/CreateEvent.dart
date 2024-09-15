
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';



class CreateEvent extends StatefulWidget {
  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();



  DateTime selectedDateTime = DateTime.now();
  final DateFormat dateFormat = DateFormat('MMM d, yyyy h:mm a');




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarr(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.prothomalo.com/prothomalo-english%2Fimport%2Fmedia%2F2019%2F04%2F13%2Fa4501e6138efb4bfd5e1d88e5cb13740-1.jpg?auto=format%2Ccompress&w=400&dpr=2.6",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.gif),
                        onPressed: () {
                          // Add GIF picking functionality here
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.photo_library),
                        onPressed: () {
                          // Add Gallery picking functionality here
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.upload),
                        onPressed: () {
                          // Add upload functionality here
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),


            // SizedBox(height: 16),
            // TextField(
            //   decoration: InputDecoration(
            //     labelText: 'Event name',
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //   ),
            // ),
            //SizedBox(height: 16),
            // InkWell(
            //   onTap: () async {
            //     // final DateTime picked = await showDatePicker(
            //     //   context: context,
            //     //   initialDate: selectedDateTime,
            //     //   firstDate: DateTime(2000),
            //     //   lastDate: DateTime(2101),
            //     // );
            //     // if (picked != null && picked != selectedDateTime) {
            //     //   setState(() {
            //     //     selectedDateTime = picked;
            //     //   });
            //     // }
            //   },
            //   child: InputDecorator(
            //     decoration: InputDecoration(
            //       labelText: 'Start date and time',
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(8.0),
            //       ),
            //     ),
            //     child: Text(
            //       dateFormat.format(selectedDateTime),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 16),

            SizedBox(height: 16),
            DescriptionField(),

            SizedBox(height: 16),
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Event Date'),
              onTap: () async {
                FocusScope.of(context).requestFocus(new FocusNode());
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (picked != null) {
                  _dateController.text = picked.toString().split(' ')[0];
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter event date';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _timeController,
              decoration: InputDecoration(labelText: 'Event Time'),
              onTap: () async {
                FocusScope.of(context).requestFocus(new FocusNode());
                TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  _timeController.text = picked.format(context);
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter event time';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Add end time functionality here
                  },
                  icon: Icon(Icons.access_time),
                  label: Text('Add end time'),
                ),
                SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add repeat event functionality here
                  },
                  icon: Icon(Icons.repeat),
                  label: Text('Repeat event'),
                ),
              ],
            ),
            TextFormField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Event Location'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter event location';
                }
                return null;
              },
            ),
            SizedBox(height: 16),




            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Is it in person or virtual?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Who can see it?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'What are the details?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Add create event functionality here
              },
              child: Center(child: Text('Create event')),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Set button width to fill the container
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class CustomAppBarr extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(160.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEC407A), Color(0xFF8E24AA)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get Ready to Create Your Event',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            Text(
              'University of Dhaka',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      // actions: [
      //   IconButton(
      //     icon: Icon(Icons.notifications, size: 30),
      //     onPressed: () {
      //       // Add notification functionality here
      //     },
      //   ),
      // ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(76.0),  // Adjust this height if needed
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Event Title',
                  suffixIcon: Icon(Icons.event, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.only(left: 40.0), // Add left padding here
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}




class DescriptionField extends StatefulWidget {
  @override
  _DescriptionFieldState createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends State<DescriptionField> {
  final TextEditingController _descriptionController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isExpanded = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            controller: _descriptionController,
            focusNode: _focusNode,
            decoration: InputDecoration(labelText: 'Event Description'),
            maxLines: _isExpanded ? 7 : 3,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter event description';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

