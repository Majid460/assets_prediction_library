class DateHelper {
  /// Converts a number of months to years and months.
  static String formatPeriod(int months) {
    final years = months ~/ 12;
    final remainingMonths = months % 12;
    return years > 0
        ? '$years years${remainingMonths > 0 ? " $remainingMonths months" : ""}'
        : '$remainingMonths months';
  }
}
