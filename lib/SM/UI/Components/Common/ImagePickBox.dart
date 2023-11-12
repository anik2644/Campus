import 'dart:io';
import 'package:dhabiansomachar/SM/Utilites/Helper/SpecificSent.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../Utilites/Helper/Raw/PickImage.dart';

class ImagePickBox extends StatefulWidget {

  final void Function(String) onImageSelected;

  final bool isProfilePhoto;
  ImagePickBox({required this.onImageSelected, required this.isProfilePhoto});

  @override
  _ImagePickBoxState createState() => _ImagePickBoxState();
}

class _ImagePickBoxState extends State<ImagePickBox> {
  String path = "null";
  String? url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Choose image");
        showImageChoices(context, (String imagePath) async {
          // Handle the selected image path here
          print('Selected Image Path: $imagePath');

          //String urll= await SendToFStorage().sendImage(imagePath);
          // Set the selected image path to pathh variable
          setState(() {
            path = imagePath;
            //url= urll!;
          });

          widget.onImageSelected(path);
        });
      },
      child: widget.isProfilePhoto && path!= "null"?

      Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: CircleAvatar(
              radius: 65.0,
              backgroundImage: FileImage(File(path)),//CachedNetworkImageProvider( imgurl ?? ""), //NetworkImage(viewModel.imgLink!),
            ),
          ),
        ),
      )
      :Container(
        width: MediaQuery.of(context).size.width,
        height: widget.isProfilePhoto? MediaQuery.of(context).size.width:MediaQuery.of(context).size.width - 30,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          border: Border.all(
            color: Theme
                .of(context)
                .colorScheme
                .secondary,
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
    );


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
}