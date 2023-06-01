import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AboutUs"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(height: 100,),
                Container(
                  width: 400,
                  height: 200,
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage("https://drive.google.com/uc?export=view&id=1POlrla5DSz2SzTbcbUPzOzR1LrETyR7t"),
                        ),

                        SizedBox(width: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Text(" Abdullah Al Mahmud\n 26 Batch \n CSE Department\n University Of Dhaka", style: TextStyle(fontSize: 15,),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                 SizedBox(
                   height: 50,
                 ),


                Container(
                  width: 400,
                  height: 200,
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        CircleAvatar(
                          radius: 50,
                          //1UMwWOeTaQMxxxYt5hr6c7sHnSzG-MZW4/view
                          backgroundImage: NetworkImage("https://drive.google.com/uc?export=view&id=1UMwWOeTaQMxxxYt5hr6c7sHnSzG-MZW4"),
                        ),
                        SizedBox(width: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Text(" Nafisa Anzum \n 26 Batch \n CSE Department\n University Of Dhaka", style: TextStyle(fontSize: 15,),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
