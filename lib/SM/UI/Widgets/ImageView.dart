import 'dart:io';
import 'package:flutter/material.dart';

class RoundedImageContainer extends StatelessWidget {
  final String imageUrl;

  RoundedImageContainer({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0), // Adjust the border radius as needed
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width -50,
          height: 240.0,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12.0), // Adjust the border radius as needed
            image: DecorationImage(
              image: FileImage(File(imageUrl)),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
