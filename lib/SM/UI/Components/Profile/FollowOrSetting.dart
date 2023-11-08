import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../ModelClass/LoginCredential.dart';

class FollowOrSetting extends StatefulWidget {
  final user;
  FollowOrSetting({this.user});

  @override
  State<FollowOrSetting> createState() => _FollowOrSettingState();
}

class _FollowOrSettingState extends State<FollowOrSetting> {
  @override
  Widget build(BuildContext context) {
    return widget.user.id == LoginCredentials().loggedInUser?.id
        ? InkWell(
      onTap: () {
        /*   Navigator.of(context).push(
                                          CupertinoPageRoute(
                                            builder: (_) => Setting(),
                                          ),
                                        );*/
      },
      child: Column(
        children: [
          Icon(
            Ionicons.settings_outline,
            color: Theme.of(context)
                .colorScheme
                .secondary,
          ),
          Text(
            'settings',
            style: TextStyle(
              fontSize: 11.5,
            ),
          )
        ],
      ),
    )
        : const Text('');
    //     : buildLikeButton();
  }
}
