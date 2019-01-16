import 'package:debout/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ActiveHoursPickerWidget extends StatelessWidget {
  final int time;
  final String timeOfDay;
  final bool hasError;
  final void Function(int val) updateTime;
  final void Function(String val) updateTimeOfDay;

  ActiveHoursPickerWidget({ Key key, this.time, this.timeOfDay, this.updateTime, this.updateTimeOfDay, this.hasError }): super(key: key);

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
                              scrollController: new FixedExtentScrollController(initialItem: this.time),
                              itemExtent: 40,
                              onSelectedItemChanged: this.updateTime,
                              children: new List<Widget>.generate(13, (index) => new Center(child: Text('$index', style:getDefaultPickerTextStyle()))),
                            )
                        ),
                        Expanded(
                            child: CupertinoPicker(
                              scrollController: new FixedExtentScrollController(initialItem: (this.timeOfDay == 'am') ? 0 : 1),
                              itemExtent: 40,
                              onSelectedItemChanged: (index) {
                                String timeOfDay = (index == 0) ? 'am' : 'pm';
                                this.updateTimeOfDay(timeOfDay);
                              },
                              children: <Widget>[
                                Align(child: Text('AM', style: getDefaultPickerTextStyle()), alignment: Alignment.centerLeft),
                                Align(child: Text('PM', style: getDefaultPickerTextStyle()), alignment: Alignment.centerLeft),
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
          child: Text(getTime(), style: this.hasError ? getContentErrorTextStyleBold() : getContentTextStyleBold()),
          decoration: this.hasError ? getErrorInputBoxDecoration() : getInputBoxDecoration(),
          padding: getInputBoxPadding(),
        )
    );
  }

  String getTime() {
    return '${this.time} ${this.timeOfDay.toUpperCase()}';
  }

}