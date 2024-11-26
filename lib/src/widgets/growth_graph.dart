import 'package:assets_prediction_library/src/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../data/growth_result.dart';

class GrowthGraph extends StatefulWidget {
  final List<GrowthResult> growthData;
  final bool inMonths;
  final TextStyle? chartTitleStyles;
  final TextStyle? primaryXAxisStyles;
  final TextStyle? primaryYAxisStyles;
  final TextStyle? labelStyles;
  const GrowthGraph(
      {super.key,
      required this.growthData,
      this.inMonths = false,
      this.chartTitleStyles,
      this.primaryXAxisStyles,
      this.primaryYAxisStyles,
      this.labelStyles});

  @override
  State<GrowthGraph> createState() => _GrowthGraphState();
}

class _GrowthGraphState extends State<GrowthGraph> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        title: ChartTitle(
            text: 'Asset Growth (${widget.inMonths ? "Months" : "Years"})',
            textStyle: widget.chartTitleStyles ??
                Styles.customStyle(
                    textSize: TextSize.SEMI_LARGE,
                    textWeight: TextWeight.MEDIUM)),
        primaryXAxis: NumericAxis(
          majorGridLines: const MajorGridLines(width: 1, color: Colors.black12),
          minorGridLines: const MinorGridLines(width: 1, color: Colors.black12),
          title: AxisTitle(
            text: widget.inMonths ? 'Months' : 'Years',
            textStyle: widget.primaryXAxisStyles ??
                Styles.customStyle(
                    textSize: TextSize.SMALL, textWeight: TextWeight.MEDIUM),
          ),
          axisLabelFormatter: (AxisLabelRenderDetails details) {
            return ChartAxisLabel(details.text,
                Styles.customStyle(textWeight: TextWeight.MEDIUM));
          },
        ),
        primaryYAxis: NumericAxis(
          majorGridLines: const MajorGridLines(width: 1, color: Colors.black12),
          minorGridLines: const MinorGridLines(width: 1, color: Colors.black12),
          title: AxisTitle(
            text: 'Balance',
            textStyle: widget.primaryYAxisStyles ??
                Styles.customStyle(
                    textSize: TextSize.SMALL, textWeight: TextWeight.MEDIUM),
          ),
          axisLabelFormatter: (AxisLabelRenderDetails details) {
            final value = details.value;
            if (value >= 1000) {
              return ChartAxisLabel(
                '${(value / 1000).toStringAsFixed(0)}k',
                Styles.customStyle(textWeight: TextWeight.MEDIUM),
              );
            }
            return ChartAxisLabel(value.toString(),
                Styles.customStyle(textWeight: TextWeight.MEDIUM));
          },
        ),
        series: <LineSeries>[
          LineSeries<GrowthResult, int>(
            dataSource: widget.growthData,
            xValueMapper: (data, _) => data.period,
            yValueMapper: (data, _) => data.balance,
            name: 'Balance',
            dataLabelSettings: DataLabelSettings(
                isVisible: true,
                textStyle: widget.labelStyles ??
                    Styles.customStyle(
                        textSize: TextSize.SMALL,
                        textWeight: TextWeight.MEDIUM)),
            color: Colors.green[600],
          ),
        ]);
  }
}
