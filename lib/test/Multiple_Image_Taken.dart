import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class TEstDoneMultipleImage extends StatefulWidget {
  @override
  _TEstDoneMultipleImageState createState() => _TEstDoneMultipleImageState();
}

class _TEstDoneMultipleImageState extends State<TEstDoneMultipleImage> {
  List<String> selectedImages = [];

  Future<void> pickImages() async {
    List<XFile>? images = await ImagePicker().pickMultiImage();
    if (images != null) {
      setState(() {
        selectedImages = images.map((image) => image.path).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Image Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: pickImages,
              child: Text('Select Images'),
            ),
            SizedBox(height: 20),
            Text(
              'Selected Images:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: selectedImages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.file(
                      File(selectedImages[index]),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(selectedImages[index]),
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
