import 'package:prediction_library/src/data/growth_result.dart';

class GrowthCalculator {
  static List<GrowthResult> calculateGrowth({
    required double initialBalance,
    required double percentageIncrease,
    required int duration,
    bool inMonths = true,
    double inflationRate = 0,
  }) {
    final List<GrowthResult> growthData = [];
    double currentBalance = initialBalance;

    final annualRate = percentageIncrease / 100;
    final inflationRateAnnual = inflationRate / 100;
    final periods = inMonths ? duration : duration * 12;
    final compoundingRate = inMonths ? annualRate / 12 : annualRate;
    final inflationCompoundingRate =
        inMonths ? inflationRateAnnual / 12 : inflationRateAnnual;

    for (int i = 1; i <= periods; i++) {
      // Apply growth
      currentBalance += currentBalance * compoundingRate;

      // Apply inflation (optional)
      if (inflationRate > 0) {
        currentBalance -= currentBalance * inflationCompoundingRate;
      }

      growthData.add(GrowthResult(
        period: inMonths ? i : (i / 12).ceil(),
        balance: double.parse(currentBalance.toStringAsFixed(2)),
      ));
    }
    return growthData;
  }
}
