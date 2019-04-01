import 'package:debout/screens/setup/setup_screen.dart';
import 'package:debout/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(DeboutApp());

class DeboutApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Debout',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'OpenSans',
      ),
      home: SplashScreen(),
    );
  }
}

class AllowNotificationsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AllowNotificationsState();
}

class AllowNotificationsState extends State<AllowNotificationsScreen> {
  @override
  Widget build(BuildContext context) {

    List<Container> children = [];

    return Scaffold(
        appBar: AppBar(
          title: Text('In Progress'),
        ),
        body: ListView(
            children: children
        )
    );
  }
}