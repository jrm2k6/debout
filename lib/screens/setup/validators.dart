import 'package:debout/utils/constants.dart';

class Validators {
  static bool validateStandingTimeSection(int standingTime, UnitTime period, UnitTime interval) {
    if (period == interval) {
      return false;
    }

    if (period == UnitTime.HOUR && standingTime > 24) {
      return false;
    }

    return true;
  }

  static bool validateActiveHours(int startTime, String startTimePeriod, int endTime, String endTimePeriod) {
    if (startTimePeriod == endTimePeriod) {
      return startTime < endTime;
    }

    var startTimePeriodAsPeriod = (startTimePeriod == 'am') ? DayPeriod.AM : DayPeriod.PM;
    var endTimePeriodAsPeriod = (endTimePeriod == 'am') ? DayPeriod.AM : DayPeriod.PM;

    return isFirstPeriodBeforeSecond(startTimePeriodAsPeriod, endTimePeriodAsPeriod);
  }
}