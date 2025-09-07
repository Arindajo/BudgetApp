import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'transactionmodel.dart';

class Reports extends StatefulWidget {
  final List<Transactionmodel> transactions;

  Reports({required this.transactions});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {};

    // Build the data for the chart
    for (final t in widget.transactions) {
      final isExpense = t.transactiontype == "Expenses";
      if (isExpense) {
        dataMap[t.category] = (dataMap[t.category] ?? 0) + t.amount;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "R E P O R T S",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: dataMap.isNotEmpty
          ? Center(
              child: PieChart(
                dataMap: dataMap,
                chartType: ChartType.ring,
                chartRadius: MediaQuery.of(context).size.width / 2.2,
                legendOptions: const LegendOptions(
                  showLegends: true,
                  legendPosition: LegendPosition.right,
                ),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: true,
                ),
              ),
            )
          : const Center(
              child: Text(
                "No expense data available yet",
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ),
    );
  }
}
