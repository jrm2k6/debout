import 'package:debout/utils/constants.dart';

class Validators {
  static bool validateStandingTimeSection(int standingTime, UnitTime period, UnitTime interval) {
    print('$standingTime period $period interval $interval');
    if (period == interval) {
      print('period $period and interval $interval are the same');
      return false;
    }

    if (period == UnitTime.HOUR && standingTime > 24) {
      print('period $period and standing time are incompatible');
      return false;
    }

    print('period $period, standing time $standingTime and interval $interval are all good');
    return true;
  }
}