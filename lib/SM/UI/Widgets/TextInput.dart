import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  late int index;
  late String text;

  TextInputWidget({required this.index, required this.text});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {

  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
   // textController = TextEditingController(text: widget.text);
    //textController.text = widget.text;
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: TextEditingController(text: widget.text),
        onChanged: (value) {
          widget.text =value;

        },
          decoration: InputDecoration(
          hintText: 'Type something...',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
