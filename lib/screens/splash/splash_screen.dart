import 'dart:async';

import 'package:debout/screens/setup/setup_screen.dart';
import 'package:debout/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:debout/utils/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  String _deviceId;

  @override
  void initState() {
    super.initState();
    this.fetchCurrentUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    Scaffold screenScaffold = Scaffold(
        body: buildBody()
    );

    return screenScaffold;
  }

  Widget buildBody() =>
      Container(
        child: Center(
          child: Text('Show Icon')
        ),
        decoration: getBaseGradientBackground(),
      );

  Future<void> fetchCurrentUserProfile() async {
    try {
      String deviceId = await UserService.getDeviceId();
      if (deviceId == null) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SetupWidget()));
      }

      DocumentReference currentUser = Firestore.instance.document('users/$deviceId');
      await Firestore.instance.runTransaction((Transaction tx) async {
        DocumentSnapshot userSnapshot = await tx.get(currentUser);
        if (userSnapshot != null && userSnapshot.exists) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SetupWidget()));
        }
      });
    } catch (error) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SetupWidget()));
    }

  }
}