import 'dart:io';

import 'package:dhabiansomachar/SM/UI/Components/Common/ImagePickBox.dart';
import 'package:flutter/material.dart';

import '../../Utilites/Services/Content/ContentPreview.dart';
import '../Components/Common/ImagePickBox.dart';
import '../Components/Common/ImagePickBox.dart';
/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CreatContent(),
    );
  }
}*/

class CreatContent extends StatefulWidget {


  @override
  _CreatContentState createState() => _CreatContentState();
}

class _CreatContentState extends State<CreatContent> {
  List<String> imageUrlIndex = [];
  List<String> textDataIndex = [];

  int imageIndex = 0;
  int textIndex = 0;
   String title ="No Title" ;
  TextEditingController tc = TextEditingController();

  List<Widget> widgetList = [];

  @override
  void initState() {

    widgetList.add(TitleField());
    widgetList.add(Introduction());
    // TODO: implement initState
    super.initState();
  }

Widget Introduction()
{
  return  Container(
    width: 100,
    height: 50,
    color: Colors.white30,
    child: Center(
      child: Text('Press add button to add something'),
    ),
  );
}
  Widget TitleField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: tc,
        onChanged: (value) {
          setState(() {
            title = value;
          });
          // Handle the text change
        },
        decoration: InputDecoration(
          hintText: 'Title...',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Write Content'),
        actions: [
          IconButton(
              onPressed: () {
                print(widgetList.length);
                print("printing text");
                textDataIndex.forEach((element) {
                  print(element);
                });

                print("printing imag");
                imageUrlIndex.forEach((element) {
                  print(element);
                });

                print("printing done");
                setState(() {});



                int i=0;
                List<String> InputImagesSequence = [];
                imageUrlIndex.forEach((element) {


                  InputImagesSequence.add(i.toString());
                  i++;
                });

                /*ContentImageSequence.clear();
                ContentSegments.clear();
                splitString(CaptionController.text, ContentImageSequence, ContentSegments);*/
                setState(() {



                  Navigator.push(context, MaterialPageRoute(builder: (context) => ContentPreview(InputImagesSequence: InputImagesSequence,
                    ContentImageSequence: imageUrlIndex, ContentSegments: textDataIndex, title: title, location: "Dhaka, Bangladesh",)));
                  // flag=0;
                });

              },
              icon: Icon(Icons.send))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widgetList.length,
              itemBuilder: (context, index) {
                return ItemBuilder(index);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showOptions,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget ItemBuilder(int index) {

      //print('$index this print');

      Widget currentWidget = widgetList[index];

    if (currentWidget is ImagePickBox) {

      int imgind =0;
     // ImagePickBox imagePickBox = currentWidget;
      for(int i =0;i<index+1;i++)
      {
        Widget cur = widgetList[i];
        if (cur is ImagePickBox) {
          imgind++;
        }
      }
      if(imageUrlIndex[imgind - 1] != "") {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 130.0,
            height: 240.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: FileImage(File(imageUrlIndex[imgind - 1])),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );


      }
      print("image pic box");
      // Your logic here
    }

    return currentWidget;
  }

  void _showOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Add Image'),
              onTap: () {
                imageIndex++;
                imageUrlIndex.add("");
                Navigator.pop(context);
                _addImageContainer(imageIndex);
              },
            ),
            ListTile(
              leading: Icon(Icons.text_fields),
              title: Text('Add Text'),
              onTap: () {
                textDataIndex.add("");
                textIndex++;
                Navigator.pop(context);
                _addTextInputField(textIndex);
              },
            ),
          ],
        );
      },
    );
  }

  void _addImageContainer(int index) {
    setState(() {
      widgetList.add(Mediainput(index));
    });
  }

  void _addTextInputField(int index) {
    setState(() {
      widgetList.add(TextInput(index));
    });
  }

  Widget Mediainput(int index) {

    int tind = index;
    ImagePickBox ip = ImagePickBox(
      onImageSelected: (String imagePath) {
        setState(() => imageUrlIndex[tind - 1] = imagePath);
      },
      isProfilePhoto: false,
    );
     return ip;/*imageUrlIndex[index - 1] != ""
        ? Container(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: CircleAvatar(
                radius: 65.0,
                backgroundImage: FileImage(File(imageUrlIndex[index - 1])),
              ),
            ),
          )
        :*/
  }

  Widget TextInput(int index) {
    TextEditingController textController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: textController,
        onChanged: (value) {
          // textController.text = value;

          if (textDataIndex.length >= index) {
            textDataIndex[index - 1] = value;
          }
/*          else{
            textDataIndex.add(value);
          }*/
          // Handle the text change
        },
        decoration: InputDecoration(
          hintText: 'Type something...',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
