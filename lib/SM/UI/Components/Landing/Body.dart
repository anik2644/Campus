import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Image.asset(
                'assets/images/Curzon.jpg',
                height: 200.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 20,),
          Text(
            "ঢাবিয়ান সমাচার",//"Press me to enter",
            style: TextStyle(fontSize: 30,color: Colors.amber, fontFamily: 'Alkatra',),
          )
        ],
      ),
    );
  }
}
