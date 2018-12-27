enum UnitTime {
  MINUTE,
  HOUR,
  DAY
}

String unitTimeToString(UnitTime val) {
  return ['minute', 'hour', 'day'][val.index];
}

UnitTime stringToUnitTime(String val) {
  Map<String, UnitTime> mapping = {
    'minute': UnitTime.MINUTE,
    'hour': UnitTime.HOUR,
    'day': UnitTime.DAY,
  };

  return mapping[val];
}