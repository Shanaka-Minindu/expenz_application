import 'package:expenz_app/models/expence_model.dart';
import 'package:expenz_app/models/income_model.dart';

import 'package:expenz_app/utils/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

class Chart extends StatefulWidget {
  final Map<Expence, double> expenseCatogoryTotal;
  final Map<Income, double> incomeCatogryTotal;
  final double expTotal;
  final double incTotal;
  final bool isExpense;

  const Chart(
      {super.key,
      required this.expenseCatogoryTotal,
      required this.incomeCatogryTotal,
      required this.isExpense, required this.expTotal, required this.incTotal});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<PieChartSectionData> getSection() {
    if (widget.isExpense) {
      return [
        PieChartSectionData(
          color: expenceCatogoryColors[Expence.food],
          value: widget.expenseCatogoryTotal[Expence.food] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expenceCatogoryColors[Expence.health],
          value: widget.expenseCatogoryTotal[Expence.health] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expenceCatogoryColors[Expence.shopping],
          value: widget.expenseCatogoryTotal[Expence.shopping] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expenceCatogoryColors[Expence.subscription],
          value: widget.expenseCatogoryTotal[Expence.subscription] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expenceCatogoryColors[Expence.transport],
          value: widget.expenseCatogoryTotal[Expence.transport] ?? 0,
          showTitle: false,
          radius: 60,
        ),
      ];
    } else {
      return [
        PieChartSectionData(
          color: incomeCatogoryColor[Income.freelance],
          value: widget.incomeCatogryTotal[Income.freelance] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCatogoryColor[Income.passiveIncome],
          value: widget.incomeCatogryTotal[Income.passiveIncome] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCatogoryColor[Income.salary],
          value: widget.incomeCatogryTotal[Income.salary] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCatogoryColor[Income.sales],
          value: widget.incomeCatogryTotal[Income.sales] ?? 0,
          showTitle: false,
          radius: 60,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final PieChartData pieChartData = PieChartData(
      sectionsSpace: 0,
      centerSpaceRadius: 70,
      startDegreeOffset: -90,
      sections: getSection(),
      borderData: FlBorderData(show: false),
    );
    return Container(
      height: 250,
      padding: EdgeInsets.all(kDefalutPadding),
      child: Stack(
        children: [
          PieChart(pieChartData),
          Center(
              child: Text(
            "\$${widget.isExpense? widget.expTotal: widget.incTotal}",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ))
        ],
      ),
    );
  }
}
