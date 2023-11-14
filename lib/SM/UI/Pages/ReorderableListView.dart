import 'dart:io';

import 'package:dhabiansomachar/SM/UI/Pages/ContentPreVieww.dart';
import 'package:dhabiansomachar/SM/UI/Pages/ContentPreview.dart';
import 'package:dhabiansomachar/SM/UI/Widgets/TopRightButtonDecorator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/ActionButton.dart';
import '../Widgets/ImageInput.dart';
import '../Widgets/ImageView.dart';
import '../Widgets/TextLebel.dart';
import 'CreateContent.dart';

/*void main() {
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

class DraggableListView extends StatefulWidget {

  final Function(List<Widget>) retWidget;
   String title;
   List<Widget> widgetList;
   DraggableListView({required this.title,required  this.retWidget, required this.widgetList,} );

  @override
  _DraggableListViewState createState() => _DraggableListViewState();
}

class _DraggableListViewState extends State<DraggableListView> {
  List<Widget> items = [];
  List<Widget> ls = [];
  @override
  void initState() {
    // items = List.generate(10, (index) => MediaInput(index));
/*    items = List.generate(10, (index) {
      if (index % 2 == 0) {
        return MediaInput(index);
      } else {
        return TextInput(index);
      }
    });*/
  widget.widgetList.asMap().forEach((index, element) {
    ls.add(
      DecoratorWidget(
        child: element,
        onPressed: () {
          // Access the index here
         // ls.removeAt(index);
           final Widget cur = ls.elementAt(index);

           setState(() {
             items.remove(cur);
             ls.removeAt(index);
           });
          print("pressed on index $index");
        },
      ),
    );

  //List.from(widget.widgetList);

  });
  items = List.from(ls);


    // TODO: implement initState
    super.initState();
  }

  List<int> indexArray = [];
  updateIndex()
  {
        ls.forEach((element) {
         // final Widget cur = ls.elementAt(index);
          indexArray.add(items.indexOf(element));

        });

        List<Widget> tempList=[];
        widget.widgetList.forEach((element) {


        });

        for(int i=0;i<ls.length;i++)
          {
            tempList.add(widget.widgetList[indexArray[i]]);
          }

       // widget.widgetList = tempList;

        widget.retWidget(tempList);

  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle the back button press logic here
        await updateIndex();
        return true; // Return true to allow the pop
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Draggable ListView'),
          actions: [
            ActionButton(
              onPressed: () {

                List<String> InputImagesSequence =[];
                List<String> ContentSegments = [];
                List<String> ContentImageSequence = [];

                print("Yes Bro");
                for(int i=0;i<items.length;i++)
                {


                  Widget cur = items[i];
                  if (cur is DecoratorWidget) {

                    Widget currentWidget = cur.child;

                    if (currentWidget is MediaInputWidget) {

                        print("media");
                      // print(imageUrlIndex[mediaCount]);
                       InputImagesSequence.add(currentWidget.path);
                       ContentImageSequence.add("1");
                    }
                    else if(currentWidget is RoundedTextContainer)
                    {
                        print("text");
                      //print(currentWidget.text);

                      ContentSegments.add(currentWidget.text);
                      ContentImageSequence.add("0");
                    }
                  }

                }
                print("No Bro");
                ContentImageSequence.forEach((element) {print(element);});
                InputImagesSequence.forEach((element) {print(element);});
                ContentSegments.forEach((element) {print(element);});

                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ContentPrevieww(InputImagesSequence: InputImagesSequence,
                    ContentImageSequence: ContentImageSequence, ContentSegments: ContentSegments, title: widget.title, location: "Dhaka, Bangladesh",)));
                });

                print('Button Pressed');
              },
            )

          ],
        ),
    /*    floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("start");

            for (int i = 0; i < items.length; i++) {
              Widget currentWidget = items[i];
              if (currentWidget is RoundedImageContainer) {
                print(currentWidget.imageUrl);
              } else if (currentWidget is RoundedTextContainer) {
                print(currentWidget.text);
              }
            }

            print("end");
          },
        ),*/
        body: ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final Widget item = items.removeAt(oldIndex);
              items.insert(newIndex, item);
            });
          },
          children: List.generate(
            items.length,
            (index) {
              return ReorderableDelayedDragStartListener(
                key: ValueKey(items[index]),
                index: index,
                child: items[index],
              );
            },
          ),
        ),
      ),
    );
  }

/*  Widget MediaInput(int index) {
    File imageFile =
    File('/data/user/0/com.example.dhabiansomachar/cache/24c1aa6d-86b5-45f0-8ce5-2faf6970c722/Screenshot_20231113-174837.png');
    return Padding(
      key: ValueKey('MediaInput$index'),
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 130.0,
        height: 240.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: FileImage(imageFile),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget TextInput(int index) {
    TextEditingController textController = TextEditingController();
    return Padding(
      key: ValueKey('TextInput$index'),
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Type something...',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }*/
}
