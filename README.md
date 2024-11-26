<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->
## Features

![Image](https://raw.githubusercontent.com/Majid460/assets_prediction_library/refs/heads/main/images/Screenshot%202024-11-26%20at%203.37.52%E2%80%AFPM.png)

The Assets Predictor Library is a powerful and flexible package designed for predicting asset growth over time. It offers customizable features, detailed growth calculations, and integration with Syncfusion Flutter Charts for seamless data visualization.

1. Predict future asset growth based on an initial balance, annual percentage increase, and duration (in years or months).
2. Support for inflation rate adjustment.
3. Integrates with Syncfusion Flutter Charts to visualize asset growth over time.
4. Adjust growth rate, inflation rate, and duration dynamically.
5. Uses a compound growth algorithm for accurate predictions.
6. Accounts for inflation to reflect realistic financial conditions.
7. Compatible with various screen sizes using responsive layout principles.

## Dependencies

[**Sizer**](https://pub.dev/packages/sizer)
[**Get**](https://pub.dev/packages/get)


## Getting started

Add the dependency in pubspec.yaml:
```dart
dependencies:
  ...
   assets_prediction_library: ^0.0.1
```  


## Usage

```dart
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


```
## Author

- [Majid Shahbaz](https://github.com/Majid460)

## Additional information

Contributions of any kind are more than welcome! Feel free to fork and improve in any way you want, make a pull request, or open an issue.

