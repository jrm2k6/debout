import 'dart:async';

import 'package:debout/utils/constants.dart';
import 'package:rxdart/subjects.dart';

class SetupBloc {
  final BehaviorSubject<int> _standingTime = BehaviorSubject<int>(seedValue: 10);
  final BehaviorSubject<UnitTime> _period = BehaviorSubject<UnitTime>(seedValue: UnitTime.MINUTE);
  final BehaviorSubject<UnitTime> _interval = BehaviorSubject<UnitTime>(seedValue: UnitTime.HOUR);
  final BehaviorSubject<int> _startTime = BehaviorSubject<int>(seedValue: 9);
  final BehaviorSubject<int> _endTime = BehaviorSubject<int>(seedValue: 5);
  final BehaviorSubject<String> _startTimePeriod = BehaviorSubject<String>(seedValue: 'am');
  final BehaviorSubject<String> _endTimePeriod = BehaviorSubject<String>(seedValue: 'pm');

  final StreamController<int> standingTimeController = StreamController<int>();
  final StreamController<UnitTime> periodController = StreamController<UnitTime>();
  final StreamController<UnitTime> intervalController = StreamController<UnitTime>();
  final StreamController<int> startTimeController = StreamController<int>();
  final StreamController<int> endTimeController = StreamController<int>();
  final StreamController<String> startTimePeriodController = StreamController<String>();
  final StreamController<String> endTimePeriodController = StreamController<String>();



  SetupBloc() {
    standingTimeController.stream.listen((int _standingTime) {
      this._standingTime.add(_standingTime);
    });

    periodController.stream.listen((UnitTime _period) {
      this._period.add(_period);
    });

    intervalController.stream.listen((UnitTime _interval) {
      this._interval.add(_interval);
    });

    startTimeController.stream.listen((int _startTime) {
      this._startTime.add(_startTime);
    });

    endTimeController.stream.listen((int _endTime) {
      this._endTime.add(_endTime);
    });

    startTimePeriodController.stream.listen((String _startTimeOfDay) {
      this._startTimePeriod.add(_startTimeOfDay);
    });

    endTimePeriodController.stream.listen((String _endTimeOfDay) {
      this._endTimePeriod.add(_endTimeOfDay);
    });
  }

  Sink<int> get standingTime => standingTimeController.sink;
  Sink<UnitTime> get period => periodController.sink;
  Sink<UnitTime> get interval => intervalController.sink;
  Sink<int> get startTime => startTimeController.sink;
  Sink<int> get endTime => endTimeController.sink;
  Sink<String> get startTimePeriod => startTimePeriodController.sink;
  Sink<String> get endTimePeriod=> endTimePeriodController.sink;

  Stream<int> get currentStandingTime => _standingTime.stream;
  Stream<UnitTime> get currentPeriod => _period.stream;
  Stream<UnitTime> get currentInterval => _interval.stream;
  Stream<int> get currentStartTime => _startTime.stream;
  Stream<int> get currentEndTime => _endTime.stream;
  Stream<String> get currentStartTimePeriod => _startTimePeriod.stream;
  Stream<String> get currentEndTimePeriod => _endTimePeriod.stream;

  void dispose() {
    _standingTime.close();
    _period.close();
    _interval.close();
    _startTime.close();
    _endTime.close();
    _startTimePeriod.close();
    _endTimePeriod.close();

    standingTimeController.close();
    periodController.close();
    intervalController.close();
    startTimeController.close();
    endTimeController.close();
    startTimePeriodController.close();
    endTimePeriodController.close();
  }
}