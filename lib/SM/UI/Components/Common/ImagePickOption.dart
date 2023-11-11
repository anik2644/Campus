import 'dart:io';
import 'package:dhabiansomachar/SM/Utilites/Helper/SpecificSent.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../Utilites/Helper/Raw/PickImage.dart';

class ImagePickBox extends StatefulWidget {

  final void Function(String) onImageSelected;

  ImagePickBox({required this.onImageSelected});

  @override
  _ImagePickBoxState createState() => _ImagePickBoxState();
}

class _ImagePickBoxState extends State<ImagePickBox> {
   String path = "null";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Choose image");
        showImageChoices(context, (String imagePath) {
          // Handle the selected image path here
          print('Selected Image Path: $imagePath');
          // Set the selected image path to pathh variable
          setState(() {
            path = imagePath;
          });

          widget.onImageSelected(path);
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width - 30,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: (path != "null")
            ? Image.file(
          File(path),
          width: 400,
          height: 400,
          fit: BoxFit.cover,
        )
            : Center(
          child: Text('No Image Selected'),
        ),
      ),
    ) ;


/*



ImagePickBox(
  onImageSelected: (String imagePath) {
    // Handle the selected image path here
    print('Received Image Path: $imagePath');
    // You can pass this path to your ViewModel or perform any other actions
  },
);


      Scaffold(
      appBar: AppBar(
      //  title: Text(),
      ),
      body:   ,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          print(path);
         String url = await SendToFStorage().sendImage(path);
         print(url);

        },//_incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
*/




  }

  showImageChoices(BuildContext context, Function(String) onImageSelected) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: .6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Select Image',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Ionicons.camera_outline),
                title: Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  // Call the callback with null for camera (you can handle it accordingly)
                  // onImageSelected(null);
                },
              ),
              ListTile(
                leading: Icon(Ionicons.image),
                title: Text('Gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  String path = await pickImagee();

                  onImageSelected(path);
                },
              ),
            ],
          ),
        );
      },
    );
  }


  // Replace this with your actual image picking logic

}


/*

void main() async {

  runApp(MyApp());
}
*/


/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
*/


/*
class MyHomePage extends StatefulWidget {
  const MyHomePage();
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return YourWidget();
  }
}*/
