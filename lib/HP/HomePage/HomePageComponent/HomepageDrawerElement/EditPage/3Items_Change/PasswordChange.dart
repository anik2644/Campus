import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../Model/StaticPart/BusStaticVariables.dart';

class PasswordChange extends StatefulWidget {
  const PasswordChange({Key? key}) : super(key: key);

  @override
  State<PasswordChange> createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Password Field"),),
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
      hintText: BusStaticVariables.Password[index],
      ),
      )
      )),
    );
  }
}
