import 'package:expenz_app/data/line_cart_data.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineCartSample extends StatelessWidget {
  const LineCartSample({super.key});

  @override
  Widget build(BuildContext context) {
    final data = LineData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 6,
          child: LineChart(
            LineChartData(
                lineTouchData: LineTouchData(
                  handleBuiltInTouches: true,
                ),
                titlesData: FlTitlesData(
                  // Remove the right title
                  rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: false,
                  )),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    barWidth: 2.5,
                    color: kMainColor,
                    belowBarData: BarAreaData(
                      gradient: LinearGradient(
                        colors: [
                          kMainColor.withOpacity(0.5),
                          Colors.transparent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      show: true,
                    ),
                    dotData: FlDotData(show: true),
                    spots: data.spots,
                  ),
                ],
                minX: 0,
                maxX: 120,
                minY: 0,
                maxY: 100),
          ),
        )
      ],
    );
  }
}
