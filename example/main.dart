import 'package:assets_prediction_library/assets_prediction_library.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PredictionExampleApp());
}

class PredictionExampleApp extends StatelessWidget {
  const PredictionExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PredictionScreen(),
    );
  }
}

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({super.key});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final double initialBalance = 1000.0;

  final double annualPercentageIncrease = 5.0;

  final int month = 12;

  final bool inMonths = true;

  @override
  Widget build(BuildContext context) {
    // Generate growth data using the GrowthCalculator
    final growthData = GrowthCalculator.calculateGrowth(
      initialBalance: initialBalance,
      percentageIncrease: annualPercentageIncrease,
      duration: month,
      inMonths: inMonths,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Asset Prediction Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Initial Balance: \$${initialBalance.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Annual Increase: $annualPercentageIncrease%',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Duration: ${inMonths ? month : month * 12} ${inMonths ? "Months" : "Years"}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GrowthGraph(
                growthData: growthData, // Pass the correct data
                inMonths: inMonths,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
