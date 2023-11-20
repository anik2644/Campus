import 'dart:io';

import 'package:dhabiansomachar/SM/UI/Components/Common/ImagePickBox.dart';
import 'package:dhabiansomachar/SM/UI/Pages/ContentPreview.dart';
import 'package:dhabiansomachar/SM/UI/Widgets/ImageInput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/Common/ImagePickBox.dart';
import '../Components/Common/ImagePickBox.dart';
import '../Widgets/ImageView.dart';
import '../Widgets/TextInput.dart';
import '../Widgets/TextLebel.dart';
import 'ReorderableListView.dart';
/*
void main() {
  runApp(TermsAndCondition());
}

class TermsAndCondition extends StatelessWidget {
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



  Future<void> _refreshData() async {
    setState(() {
         // editList();
    });
  }







  editList()
  {
    List<Widget> twlist = [];//List.from(widgetList);;
    List<Widget> temphere = List.from(widgetList);
 //   int mediaCount =0;
 //   int textCount =0;
    int len = widgetList.length;

    print("start");
    for(int i=2;i<len;i++)
      {

        Widget currentWidget = widgetList[i];

        if (currentWidget is MediaInputWidget) {

            print("media");
         // print(imageUrlIndex[mediaCount]);
          if(currentWidget.path !="") {
            twlist.add(currentWidget);


           // twlist.removeAt(0);
          }
          else{
            temphere.remove(widgetList[i]);
            //twlist.removeAt(twlist.length-1);

           // twlist.add(RoundedImageContainer(imageUrl: imageUrlIndex[mediaCount]));
          }
          //mediaCount++;
        }
        else if(currentWidget is TextInputWidget)
          {
            print("text");
            print(currentWidget.text);

            if(currentWidget.text == "" || currentWidget.text.isEmpty) {
              temphere.remove(widgetList[i]);
             // twlist.removeAt();
            }
            else{

              twlist.add(RoundedTextContainer(text: currentWidget.text));
              //twlist.removeAt(twlist.length-1);
/*
              twlist.add( Text(textDataIndex[textCount],
                style: TextStyle(fontSize: 16.0),
              ));
*/

            }

          //  textCount++;
          }

      }

    widgetList = temphere;
    print("end");

    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (_) => DraggableListView(title: tc.text,widgetList: twlist,

          retWidget: (List<Widget> returnedWidget) {

            returnedWidget.forEach((element) {

              if(element is RoundedTextContainer)
                {
                  int index = returnedWidget.indexOf(element);
                  Widget temp = TextInputWidget(index: index, text: element.text,);
                 // Widget temp = TextInputWidget(index: returnedWidget.indexOf(element), text: element.text);
                  returnedWidget.replaceRange(index, index + 1, [temp]);
                }
            });

            setState(() {

              returnedWidget.insert(0, widgetList[1]);
              returnedWidget.insert(0, widgetList[0]);
              widgetList = returnedWidget;
             // path = imagePath;
            });

           // print('getting the path: $imagePath');
          },
        ),
      ),
    );

  }







  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Write Content'),
          actions: [
            IconButton(
                onPressed: () {


                  editList();

                  //
                  // List<String> InputImagesSequence = List.from(imageUrlIndex);
                  // InputImagesSequence.removeWhere((element) => element=="");
                  // List<String> ContentSegments = List.from(textDataIndex);
                  // ContentSegments.removeWhere((element) => element==""|| element.isEmpty);
                  // int i=0;
                  // List<String> ContentImageSequence = [];
                  // InputImagesSequence.forEach((element) {ContentImageSequence.add(i.toString());i++;});
                  //
                  // setState(() {
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => ContentPreview(InputImagesSequence: InputImagesSequence,
                  //     ContentImageSequence: ContentImageSequence, ContentSegments: ContentSegments, title: title, location: "Dhaka, Bangladesh",)));
                  // });
                  //
                  //


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
                  return  widgetList[index];//ItemBuilder(index);
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showOptions,
          child: Icon(Icons.add),
        ),
      ),
    );
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



                MediaInputWidget temp = MediaInputWidget(index: imageIndex, path: "");
                imageIndex++;
                imageUrlIndex.add("");
                setState(() {
                  widgetList.add(temp);
                });
                Navigator.pop(context);
              //  _addImageContainer(imageIndex);
              },
            ),
            ListTile(
              leading: Icon(Icons.text_fields),
              title: Text('Add Text'),
              onTap: () {

                TextInputWidget temp = TextInputWidget(index: textIndex, text: "");
                textDataIndex.add("");
                textIndex++;

                setState(() {
                  widgetList.add(temp);
                });

                Navigator.pop(context);
               // _addTextInputField(textIndex);
              },
            ),
          ],
        );
      },
    );
  }




/*

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
     // print("image pic box");
      // Your logic here
    }

    return currentWidget;
  }
*/




/*
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
  */

/*

  editList()
  {
    List<Widget> twlist = [];//List.from(widgetList);

    // twlist.removeAt(0);
    // twlist.removeAt(0);
    List<Widget> temphere = List.from(widgetList);
    int mediaCount =0;
    int textCount =0;
    int len = widgetList.length;

    print("start");
 //   imageUrlIndex.forEach((element) {print(element);});
   // print("done");
  //  textDataIndex.forEach((element) {print(element);});
   // print("end");

    for(int i=2;i<len;i++)
      {


        Widget currentWidget = widgetList[i];

        if (currentWidget is ImagePickBox) {

            //print("object");
          print(imageUrlIndex[mediaCount]);
          if(imageUrlIndex[mediaCount] == "") {

            temphere.remove(widgetList[i]);
           // twlist.removeAt(0);
          }
          else{

            //twlist.removeAt(twlist.length-1);

            twlist.add(RoundedImageContainer(imageUrl: imageUrlIndex[mediaCount]));
          }
          mediaCount++;
        }
        else if(currentWidget is Padding)
          {
            print("text");
            print(textDataIndex[textCount]);

            if(textDataIndex[textCount] == ""||textDataIndex[textCount].isEmpty) {
              temphere.remove(widgetList[i]);
             // twlist.removeAt();
            }
            else{

              //twlist.removeAt(twlist.length-1);
/*
              twlist.add( Text(textDataIndex[textCount],
                style: TextStyle(fontSize: 16.0),
              ));
*/
             twlist.add(RoundedTextContainer(text: textDataIndex[textCount]));
            }

            textCount++;
          }

      }

    widgetList = temphere;
    print("end");


    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (_) => DraggableListView(twlist),
      ),
    );

  }

  */





/*

  Widget Mediainput(int index) {

    int tind = index;
    ImagePickBox ip = ImagePickBox(
      onImageSelected: (String imagePath) {
        setState(() => imageUrlIndex[tind - 1] = imagePath);
      },
      isProfilePhoto: false,
    );
     return ip;*/
/*imageUrlIndex[index - 1] != ""
        ? Container(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: CircleAvatar(
                radius: 65.0,
                backgroundImage: FileImage(File(imageUrlIndex[index - 1])),
              ),
            ),
          )
        :*//*

  }
*/

/*  Widget TextInput(int index) {
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
*/
/*          else{
            textDataIndex.add(value);
          }*/
/*
          // Handle the text change
        },
        decoration: InputDecoration(
          hintText: 'Type something...',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }*/
}
