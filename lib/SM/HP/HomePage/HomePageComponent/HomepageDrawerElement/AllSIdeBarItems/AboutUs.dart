import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        //backgroundColor: Colors.black,
        title: Text("Let Be Introduced with Admin"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [

            Container(
            padding: EdgeInsets.only(bottom: 10,top: 50),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.black,
                child: Text(
                  "About Us",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )),

                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 400,
                    height: 200,
                    child: Card(
                      elevation: 5.0,
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: CachedNetworkImageProvider(
                              'https://drive.google.com/uc?export=view&id=1BJT3eIJq23I1Cy7z7p6vAaCEplBox1YG',
                            ),
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
                ),

                 SizedBox(
                   height: 50,
                 ),


                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 400,
                    height: 200,
                    child: Card(
                      elevation: 5.0,
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          CircleAvatar(
                            radius: 50,
                            //1UMwWOeTaQMxxxYt5hr6c7sHnSzG-MZW4/view
                            backgroundImage:CachedNetworkImageProvider(
                              'https://drive.google.com/uc?export=view&id=1UMwWOeTaQMxxxYt5hr6c7sHnSzG-MZW4',
                            ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
