import 'package:debout/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntervalPickerWidget extends StatefulWidget {
  final String interval;
  final void Function(String selectedInterval) updateInterval;
  IntervalPickerWidget({Key key, this.interval, this.updateInterval}): super(key: key);

  @override
  State<StatefulWidget> createState() => IntervalPickerWidgetState();

}

class IntervalPickerWidgetState extends State<IntervalPickerWidget> {
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
                                scrollController: new FixedExtentScrollController(initialItem: (widget.interval == 'hour') ? 0 : 1),
                                itemExtent: 40,
                                onSelectedItemChanged: (index) {
                                  String interval = (index == 0) ? 'hour' : 'day';
                                  widget.updateInterval(interval);
                                },
                                children: <Widget>[
                                  Center(child: Text('Hour', style: getDefaultPickerTextStyle())),
                                  Center(child: Text('Day', style: getDefaultPickerTextStyle())),
                                ],
                              )
                          )
                        ]
                    )
                );
              }
          );
        },
        child: Container(
          child: Text('${widget.interval}', style: getContentTextStyleBold()),
          decoration: getInputBoxDecoration(),
          padding: getInputBoxPadding(),
        )
    );
  }
}