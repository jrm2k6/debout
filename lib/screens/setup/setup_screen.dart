import 'package:debout/screens/setup/setup_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:debout/components/active_hours_picker_widget.dart';
import 'package:debout/components/interval_picker_widget.dart';
import 'package:debout/components/section_header.dart';
import 'package:debout/components/standing_timepicker_widget.dart';
import 'package:debout/utils/styles.dart';
import 'package:debout/screens/setup/setup_provider.dart';


class SetupWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Scaffold screenScaffold = Scaffold(
        appBar: AppBar(
          title: Text('Get Started'),
          flexibleSpace: Container(decoration: getBaseGradientBackground()),
        ),
        body: buildBody()
    );

    return SetupProvider(
      setupBloc: SetupBloc(),
      child: screenScaffold,
    );
  }

  Widget buildBody() =>
    Container(
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
                        StandingTimeSection(),
                        IntervalSection(),
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
                        ActiveHoursStartSection(),
                        ActiveHoursEndSection(),
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
    );
}

class StandingTimeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final setupBloc = SetupProvider.of(context);
    return StreamBuilder<String>(
      stream: setupBloc.currentPeriod,
      initialData: 'minutes',
      builder: (context, snapshotCurrentPeriod) {
        return StreamBuilder<int>(
          stream: setupBloc.currentStandingTime,
          initialData: 20,
          builder: (context, snapshotCurrentStandingTime) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('I want to stand for ', style: getContentTextStyle()),
                StandingTimePickerWidget(
                  period: snapshotCurrentPeriod.data,
                  standingTime: snapshotCurrentStandingTime.data,
                  updatePeriod: setupBloc.period.add,
                  updateStandingTime: setupBloc.standingTime.add
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class IntervalSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SetupBloc setupBloc = SetupProvider.of(context);
    return StreamBuilder<String>(
      stream: setupBloc.currentInterval,
      initialData: 'hour',
      builder: (context, snapshot) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('every ', style: getContentTextStyle()),
              IntervalPickerWidget(interval: snapshot.data, updateInterval: setupBloc.interval.add),
            ]
        );
      },
    );
  }
}

class ActiveHoursStartSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SetupBloc setupBloc = SetupProvider.of(context);
    return StreamBuilder<int>(
      stream: setupBloc.currentStartTime,
      initialData: 9,
      builder: (context, snapshotStartTime) {
        return StreamBuilder<String>(
          stream: setupBloc.currentStartTimePeriod,
          initialData: 'am',
          builder: (context, snapshotStartTimePeriod) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('My active hours are from ', style: getContentTextStyle()),
                ActiveHoursPickerWidget(
                  time: snapshotStartTime.data,
                  timeOfDay: snapshotStartTimePeriod.data,
                  updateTime: setupBloc.startTime.add,
                  updateTimeOfDay: setupBloc.startTimePeriod.add
                ),
              ],
            );
          }
        );
      }
    );
  }
}

class ActiveHoursEndSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SetupBloc setupBloc = SetupProvider.of(context);
    return StreamBuilder<int>(
        stream: setupBloc.currentEndTime,
        initialData: 5,
        builder: (context, snapshotEndTime) {
          return StreamBuilder<String>(
            stream: setupBloc.currentEndTimePeriod,
            initialData: 'pm',
            builder: (context, snapshotEndTimePeriod) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('to ', style: getContentTextStyle()),
                  ActiveHoursPickerWidget(
                    time: snapshotEndTime.data,
                    timeOfDay: snapshotEndTimePeriod.data,
                    updateTime: setupBloc.endTime.add,
                    updateTimeOfDay: setupBloc.endTimePeriod.add
                  ),
                ],
              );
            }
          );
        }
    );
  }

}