//import 'package:campousia/Screen/HomePage/HomePageComponent/HomepageBodyComponant/StartButtonComponents/StartButtonBuilder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'StartButtonComponents/StartButtonBuilder.dart';

class StartBUtton extends StatefulWidget {

  StartButtonBuilder sTartButton = StartButtonBuilder();

  @override
  State<StartBUtton> createState() => _StartBUttonState();
}

class _StartBUttonState extends State<StartBUtton> {




  @override
  Widget build(BuildContext context) {
    return  widget.sTartButton;
  }
}
