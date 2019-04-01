import 'package:debout/services/user_service.dart';
import 'package:debout/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AllowNotificationsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AllowNotificationsState();
}
class AllowNotificationsState extends State<AllowNotificationsScreen> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Scaffold screenScaffold = Scaffold(
        appBar: AppBar(
          title: Text('Get Started'),
          flexibleSpace: Container(decoration: getBaseGradientBackground()),
        ),
        body: buildBody()
    );

    return screenScaffold;
  }

  buildBody() =>
    Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    child: Text(
                      'To help you build your standing habits, we would like to send you notifications to remind you of when to stand based on the settings you added.',
                      style: TextStyle(fontSize: 16),
                    ),
                    padding: EdgeInsets.all(24.0),
                  )
                )
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Padding(
                    child: FlatButton(
                      textColor: Colors.white,
                      color: Color(0xFF3023AE).withOpacity(0.7),
                      child: Text('Allow notifications', style: TextStyle(fontSize: 18)),
                      onPressed: () {
                        _firebaseMessaging.requestNotificationPermissions(const IosNotificationSettings(sound: true, badge: true, alert: true));
                        _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
                          print("Settings registered: $settings");
                        });
                        _firebaseMessaging.getToken().then((String token) {
                          // save to firestore
                          UserService.saveNotificationToken(token);
                        });
                      },
                      padding: EdgeInsets.all(16.0),
                    ),
                    padding: EdgeInsets.all(8.0),
                  ),
                  padding: EdgeInsets.all(8.0),
                )
              ],
            )
          ],
        )
      )
    );
}