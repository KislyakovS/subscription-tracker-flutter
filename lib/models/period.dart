enum PeriodType {
  day,
  week,
  month,
}

class Period {
  final int count;
  final PeriodType type;

  Period({
    required this.count,
    required this.type,
  });
}
