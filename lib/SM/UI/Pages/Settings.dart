import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Utilites/ViewModel/theme_view_model.dart';


//import 'package:social_media_app/view_models/theme/theme_view_model.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  bool isDarkMode =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.keyboard_backspace),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        title: Text(
          "Settings",
          style: TextStyle(),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
                title: Text(
                  "About",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                subtitle: Text(
                  "This is Dhabian Somachar Made by Anik & Nafisa",
                ),
                trailing: Icon(Icons.error)),
            Divider(),


            ListTile(
              title: Text(
                "Dark Mode",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
              subtitle: Text("Use the dark mode"),
              trailing: Switch(
                onChanged: (bool value) {
                  setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Dark mode is ${value ? 'on' : 'off'}"),
                        duration: Duration(seconds: 2), // You can customize the duration
                      ),
                    );

                    print("Dark mode is ${value ? 'on' : 'off'}");
                    isDarkMode = value;
                  });
                }, value: isDarkMode,
              ),
                

/*              Consumer<ThemeProvider>(
                builder: (context, notifier, child) => CupertinoSwitch(
                  onChanged: (val) {
                    notifier.toggleTheme();
                  },
                  value: notifier.dark,
                  activeColor: Theme.of(context).colorScheme.secondary,
                ),
              ),*/
            ),


          ],
        ),
      ),
    );
  }

}
