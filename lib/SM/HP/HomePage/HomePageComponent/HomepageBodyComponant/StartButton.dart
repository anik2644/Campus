//import 'package:campousia/Screen/HomePage/HomePageComponent/HomepageBodyComponant/StartButtonComponents/StartButtonBuilder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../UI/Helper/HPStrategy.dart';

class StartBUtton extends StatefulWidget {
  StartButtonBuilder sTartButton = StartButtonBuilder();

  @override
  State<StartBUtton> createState() => _StartBUttonState();
}

class _StartBUttonState extends State<StartBUtton> {
  @override
  Widget build(BuildContext context) {
    return widget.sTartButton;
  }
}

class StartButtonBuilder extends StatefulWidget {
  StartButtonBody bOdy = StartButtonBody();

  @override
  State<StartButtonBuilder> createState() => _StartButtonBuilderState();
}

class _StartButtonBuilderState extends State<StartButtonBuilder> {
  void StartButtonOnPressed() {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HPStretegy() // Landing(),//SecondaryHomepage()
              ));
    });

   
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: StartButtonOnPressed,
      child: widget.bOdy,
    );
  }
}

class StartButtonBody extends StatefulWidget {
  @override
  State<StartButtonBody> createState() => _StartButtonBodyState();
}

class _StartButtonBodyState extends State<StartButtonBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 5,
        width: double.infinity,
        color: Colors.black,
        child: Center(
            child: Text(
          "ঢাবিয়ান সমাচার", //"Press me to enter",
          style: TextStyle(
            fontSize: 30,
            color: Colors.amber,
            fontFamily: 'Alkatra',
          ),
        )

            //     .animate(
            //
            //   //delay: 1000.ms, // this delay only happens once at the very start
            //   onPlay: (controller) => controller.repeat(), // loop
            // ).fadeIn(duration: 1500.ms).fadeOut(delay: 3500.ms, duration: 200.ms) // runs after fade.),
            ));
  }
}
