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
      child: TextFormField(
        maxLines: null,
        // initialValue: widget.user!.bio,

        controller: TextEditingController(text: widget.text),
        autovalidateMode: AutovalidateMode.onUserInteraction,
/*        validator: (String? value) {
          if (value!.length > 1000) {
            return 'Bio must be short';
          }
          return null;
        },*/
        onSaved: (String? val) {
          widget.text = val!;
          //viewModel.setBio(val!);
        },
        onChanged: (String val) {
          widget.text = val;
          // viewModel.setBio(val);
        },

        decoration: InputDecoration(
          hintText: 'Enter your text segment',
          contentPadding:
          EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          isDense: true,
        ),
      ),

      /* TextField(
        controller: TextEditingController(text: widget.text),
        onChanged: (value) {
          widget.text =value;

        },
          decoration: InputDecoration(
          hintText: 'Type something...',
          border: OutlineInputBorder(),
        ),
      ),*/
    );
  }
}

/*
                TextFormField(
                  maxLines: null,
                 // initialValue: widget.user!.bio,
                  controller: bioController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value!.length > 1000) {
                      return 'Bio must be short';
                    }
                    return null;
                  },
                  onSaved: (String? val) {
                    bio= val!;
                    //viewModel.setBio(val!);
                  },
                  onChanged: (String val) {
                    bio= val;
                   // viewModel.setBio(val);
                  },

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                    isDense: true,
                  ),

                ),
 */
