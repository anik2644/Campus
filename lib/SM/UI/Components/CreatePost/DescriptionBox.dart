import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionBox extends StatefulWidget {

  final Function(String) onDescriptionChanged;
  const DescriptionBox({Key? key,required this.onDescriptionChanged}) : super(key: key);

  @override
  State<DescriptionBox> createState() => _DescriptionBoxState();
}

class _DescriptionBoxState extends State<DescriptionBox> {

  late String des;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(height: 20.0),
        Text(
          'Post Caption'.toUpperCase(),
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextFormField(
          // initialValue: viewModel.description,
          decoration: InputDecoration(
            hintText: 'Eg. This is very beautiful place!',
            focusedBorder: UnderlineInputBorder(),
          ),
          maxLines: null,
          onChanged: (val) {
            des =val;
            widget.onDescriptionChanged(des);
            // viewModel.setDescription(val);
          },
        ),
      ],
    );
  }
}
