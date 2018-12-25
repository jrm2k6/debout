import 'package:debout/components/active_hours_picker_widget.dart';
import 'package:debout/components/interval_picker_widget.dart';
import 'package:debout/components/section_header.dart';
import 'package:debout/components/standing_timepicker_widget.dart';
import 'package:debout/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetupWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SetupWidgetState();

}

class SetupWidgetState extends State<SetupWidget> {
  String period = 'minutes';
  int standingTime = 10;
  String interval = 'hour';
  int startTime = 10;
  String startTimeOfDay = 'am';
  int endTime = 5;
  String endTimeOfDay = 'pm';

  void updatePeriod(String selectedPeriod) {
    setState(() {
      period = selectedPeriod;
    });
  }

  void updateStandingTime(int time) {
    setState(() {
      standingTime = time;
    });
  }

  void updateStartTimeOfDay(String timeOfDay) {
    setState(() {
      startTimeOfDay = timeOfDay;
    });
  }

  void updateEndTimeOfDay(String timeOfDay) {
    setState(() {
      endTimeOfDay = timeOfDay;
    });
  }

  void updateStartTime(int time) {
    setState(() {
      startTime = time;
    });
  }

  void updateEndTime(int time) {
    setState(() {
      endTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    Scaffold screenScaffold = Scaffold(
        appBar: AppBar(
          title: Text('Get Started'),
          flexibleSpace: Container(decoration: getBaseGradientBackground()),
        ),
        body: Container(
            color: Colors.white,
            child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SectionHeader(asset: 'assets/icon-launch.svg', size: 48.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text('I want to stand for ', style: getContentTextStyle()),
                                StandingTimePickerWidget(period: period, standingTime: standingTime, updatePeriod: updatePeriod, updateStandingTime: updateStandingTime),
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text('every ', style: getContentTextStyle()),
                                  IntervalPickerWidget(interval: interval, updateInterval: updateInterval)
                                ]
                            )
                          ],
                        ),
                      )
                  ),
                  Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SectionHeader(asset: 'assets/icon-time.svg', size: 48.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text('My active hours are from ', style: getContentTextStyle()),
                                ActiveHoursPickerWidget(time: startTime, timeOfDay: startTimeOfDay, updateTime: updateStartTime, updateTimeOfDay: updateStartTimeOfDay),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text('to ', style: getContentTextStyle()),
                                ActiveHoursPickerWidget(time: endTime, timeOfDay: endTimeOfDay, updateTime: updateEndTime, updateTimeOfDay: updateEndTimeOfDay),
                              ],
                            ),
                          ],
                        ),
                      )
                  ),

                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                          onTap: () {
//                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllowNotificationScreen()));
                          },
                          child: Container(
                            decoration: getBaseGradientBackground(),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Next', style: getButtonBaseTextStyle()),
                                Icon(Icons.navigate_next, color: Color(0xFFFFFFFF), size: 40.0,)
                              ],
                            ),
                          )
                      )
                  )
                ]
            )
        )
    );

    return screenScaffold;
  }

  void updateInterval(String selectedInterval) {
    setState(() {
      interval = selectedInterval;
    });
  }
}