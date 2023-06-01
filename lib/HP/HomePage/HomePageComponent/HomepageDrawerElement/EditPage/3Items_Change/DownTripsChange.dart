import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../Model/StaticPart/BusStaticVariables.dart';

class DownTripChange extends StatefulWidget {
  const DownTripChange({Key? key}) : super(key: key);

  @override
  State<DownTripChange> createState() => _DownTripChangeState();
}

class _DownTripChangeState extends State<DownTripChange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Downtrips Field"),),
      floatingActionButton: FloatingActionButton(onPressed: () {},child: Icon(Icons.done_outline_sharp),),
      body: Container(
          child:ListView.builder(
          //shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount:  BusStaticVariables.Uptrips.length,
          padding: EdgeInsets.only(right: 25, left: 25, top: 10),
      itemBuilder: (context, index) =>
      TextField(
      decoration: InputDecoration(
      hintText: BusStaticVariables.Uptrips[index],
      ),
      )
      )
      ),
    );
  }
}
