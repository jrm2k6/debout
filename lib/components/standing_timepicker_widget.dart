import 'package:debout/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StandingTimePickerWidget extends StatefulWidget {
  final String period;
  final int standingTime;
  final void Function(String val) updatePeriod;
  final void Function(int val) updateStandingTime;

  StandingTimePickerWidget({ Key key, this.period, this.standingTime, this.updatePeriod, this.updateStandingTime}): super(key: key);

  @override
  State<StatefulWidget> createState() => StandingTimePickerState();
}

class StandingTimePickerState extends State<StandingTimePickerWidget> {
  getStandingTimeChoices() {
    List<Widget> choices = new List();
    for (var x = 1; x < 60; x++) {
      choices.add(new Align(alignment: Alignment.center, child: Text('$x', style: getDefaultPickerTextStyle())));
    }

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return showModalBottomSheet(
            context: context,
            builder: (BuildContext content) {
              return Container(
                height: 200,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: CupertinoPicker(
                        scrollController: new FixedExtentScrollController(initialItem: widget.standingTime),
                        itemExtent: 40,
                        onSelectedItemChanged: (index) { widget.updateStandingTime(index + 1); },
                        children: this.getStandingTimeChoices(),
                      )
                    ),
                    Expanded(
                      child: CupertinoPicker(
                        scrollController: new FixedExtentScrollController(initialItem: (widget.period == 'minutes') ? 0 : 1),
                        itemExtent: 40,
                        onSelectedItemChanged: (index) {
                          String period = (index == 0) ? 'minutes' : 'hours';
                          widget.updatePeriod(period);
                        },
                        children: <Widget>[
                          Align(child: Text('Minute(s)', style: getDefaultPickerTextStyle()), alignment: Alignment.centerLeft),
                          Align(child: Text('Hour(s)', style: getDefaultPickerTextStyle()), alignment: Alignment.centerLeft),
                        ],
                      )
                    ),
                  ],
                )
              );
            }
          );
        },
        child: Container(
          decoration: getInputBoxDecoration(),
          padding: getInputBoxPadding(),
          child: Text(getStandingTime(), style: getContentTextStyleBold()),
        )
    );
  }

  String getStandingTime() {
    String period = widget.period;
    if (widget.standingTime <= 1) {
      period = (widget.period == 'minutes') ? 'minute' : 'hour';
    }

    return '${widget.standingTime} $period';

  }

}
