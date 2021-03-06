import 'package:debout/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class StandingTimePickerWidget extends StatelessWidget {
  final String period;
  final int standingTime;
  final bool hasError;
  final void Function(String val) updatePeriod;
  final void Function(int val) updateStandingTime;

  StandingTimePickerWidget({
    Key key,
    this.period,
    this.standingTime,
    this.updatePeriod,
    this.updateStandingTime,
    this.hasError
  }): super(key: key);

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
                        scrollController: new FixedExtentScrollController(initialItem: this.standingTime),
                        itemExtent: 40,
                        onSelectedItemChanged: (index) { this.updateStandingTime(index + 1); },
                        children: this.getStandingTimeChoices(),
                      )
                    ),
                    Expanded(
                      child: CupertinoPicker(
                        scrollController: new FixedExtentScrollController(initialItem: (this.period == 'minute') ? 0 : 1),
                        itemExtent: 40,
                        onSelectedItemChanged: (index) {
                          String period = (index == 0) ? 'minute' : 'hour';
                          this.updatePeriod(period);
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
          decoration: this.hasError ? getErrorInputBoxDecoration() : getInputBoxDecoration(),
          padding: getInputBoxPadding(),
          child: Text(getStandingTime(), style: this.hasError ? getContentErrorTextStyleBold() : getContentTextStyleBold()),
        )
    );
  }

  String getStandingTime() {
    String period = this.period;
    if (this.standingTime > 1) {
      period = (this.period == 'minute') ? 'minutes' : 'hours';
    }

    return '${this.standingTime} $period';

  }

}
