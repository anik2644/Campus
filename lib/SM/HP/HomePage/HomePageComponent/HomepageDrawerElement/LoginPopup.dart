
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import '../../../../../../../../../Model/StaticPart/ModelStatic.dart';
import 'LoginButton.dart';

class LoginPopup{
  BuildContext context;
  int index;
      LoginPopup(this.context,this.index){
        print("hey dear");
      }




  var _noticeController = new TextEditingController();
  var _passCodeController = new TextEditingController();

  Widget LoginField()
  {
    return Container(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Center(
            child: ListTile(
              title: Text("Enter Username and Password",
            style: TextStyle(
                color: Colors.red, fontSize: 17,
              ),),
            ),
          ),
              TextField(
                decoration: InputDecoration(
                  hintText: "User Name",
                ),
                controller: _noticeController,
              ),
              SizedBox(height: 10,),
              TextField(
                controller: _passCodeController,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
              Center(child: LoginButton(this._noticeController,this.index,this._passCodeController)),
            ],
          ),
        ));
  }





  Future openDialouge(int index) => showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child:LoginField()));



}