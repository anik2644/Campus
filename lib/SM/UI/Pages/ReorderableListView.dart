import 'dart:io';

import 'package:dhabiansomachar/SM/UI/Widgets/TopRightButtonDecorator.dart';
import 'package:flutter/material.dart';

import '../Widgets/ImageView.dart';
import '../Widgets/TextLebel.dart';
import 'CreateContent.dart';

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
}

class DraggableListView extends StatefulWidget {
  final List<Widget> widgetList;
  DraggableListView(this.widgetList);

  @override
  _DraggableListViewState createState() => _DraggableListViewState();
}

class _DraggableListViewState extends State<DraggableListView> {
  List<Widget> items = [];

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


  List<Widget> ls= [];
  widget.widgetList.forEach((element) {
    ls.add(DecoratorWidget(child: element,onPressed: (){print("pressed");},));

    items = List.from(ls);//List.from(widget.widgetList);

  });


    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable ListView'),
      ),
      floatingActionButton: FloatingActionButton(
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
      ),
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
