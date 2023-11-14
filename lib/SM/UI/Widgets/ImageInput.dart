import 'package:dhabiansomachar/SM/UI/Widgets/ImageView.dart';
import 'package:flutter/material.dart';

import '../Components/Common/ImagePickBox.dart';

class MediaInputWidget extends StatefulWidget {
  late int index;
  late String path;

  MediaInputWidget({required this.index, required this.path});

  @override
  State<MediaInputWidget> createState() => _MediaInputWidgetState();
}

class _MediaInputWidgetState extends State<MediaInputWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.path != ""?
     RoundedImageContainer(imageUrl: widget.path)
    :ImagePickBox(
      onImageSelected: (onImageSelected){

        setState(() {
          widget.path =onImageSelected;
        });

      },
      isProfilePhoto: false,
    );
  }
}
