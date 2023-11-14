import 'package:flutter/material.dart';

class DecoratorWidget extends StatelessWidget {
  final Widget child;
  final IconData icon = Icons.remove;
  final VoidCallback? onPressed;

  DecoratorWidget({
    required this.child,
    //required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 8.0,
          right: 8.0,
          child: Container(
            padding: EdgeInsets.all(8.0), // Add padding to increase the hit area
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // Adjust the color as needed
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(icon),
              onPressed: onPressed,
            ),
          ),
        ),
      ],
    );
  }
}
