import 'package:debout/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllowNotificationsScreen extends StatelessWidget {
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
      child: Text('Allow notification screen')
    );
}