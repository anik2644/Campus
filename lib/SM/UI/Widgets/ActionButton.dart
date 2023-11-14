import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  ActionButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all( 6.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Card(
          color: Colors.white,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0,right: 12.0,top: 2.0,bottom: 2.0),
            child: Center(
              child: Text(
                'Preview',
                style: TextStyle(
                  color: Colors.black, // Customize text color
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
