import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../data/growth_result.dart';

class GrowthGraph extends StatefulWidget {
  final List<GrowthResult> growthData;
  final bool inMonths;

  const GrowthGraph(
      {super.key, required this.growthData, this.inMonths = false});

  @override
  State<GrowthGraph> createState() => _GrowthGraphState();
}

class _GrowthGraphState extends State<GrowthGraph> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        title: ChartTitle(
            text: 'Asset Growth (${widget.inMonths ? "Months" : "Years"})'),
        primaryXAxis: NumericAxis(
          title: AxisTitle(text: widget.inMonths ? 'Months' : 'Years'),
        ),
        primaryYAxis: const NumericAxis(
          title: AxisTitle(text: 'Balance'),
        ),
        series: <LineSeries>[
          LineSeries<GrowthResult, int>(
            dataSource: widget.growthData,
            xValueMapper: (data, _) => data.period,
            yValueMapper: (data, _) => data.balance,
            name: 'Balance',
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            color: Colors.green[600],
          ),
        ]);
  }
}
