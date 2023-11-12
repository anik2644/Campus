import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/Common/ImagePickBox.dart';

class TakeImage extends StatefulWidget {
  final Function(String) onImageSelected;
  final bool isProfilePhoto;

  const TakeImage({Key? key, required this.onImageSelected, required this.isProfilePhoto}) : super(key: key);



  @override
  State<TakeImage> createState() => _TakeImageState();
}

class _TakeImageState extends State<TakeImage> {

  String path="null";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){

            widget.onImageSelected(path);
            Navigator.pop(context);
          }, icon: Icon(Icons.done))
        ],
      ),
      body: ImagePickBox(
        onImageSelected: (String imagePath) {
          setState(() => path = imagePath);
          // Handle the selected image path here
          print('Received Image Path: $imagePath');
        }, isProfilePhoto: false,
      ) ,
    );
  }
}
