import 'package:flutter/material.dart';
import '../logic/growth_calculator.dart';
import '../widgets/growth_graph.dart';
import '../utils/date_helper.dart';

class AssetGrowthWidget extends StatelessWidget {
  final double initialBalance;
  final double percentageIncrease;
  final int duration;
  final bool inMonths;

  const AssetGrowthWidget({
    super.key,
    required this.initialBalance,
    required this.percentageIncrease,
    required this.duration,
    this.inMonths = true,
  });

  @override
  Widget build(BuildContext context) {
    final growthData = GrowthCalculator.calculateGrowth(
      initialBalance: initialBalance,
      percentageIncrease: percentageIncrease,
      duration: duration,
      inMonths: inMonths,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Asset Growth Prediction')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Prediction for ${inMonths ? duration : DateHelper.formatPeriod(duration * 12)}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GrowthGraph(growthData: growthData, inMonths: inMonths),
          ),
        ],
      ),
    );
  }
}
