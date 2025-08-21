import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'transactionmodel.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  List<Transactionmodel> transactions = [
  Transactionmodel(date:DateTime.now(),transactiontype:"Expenses",category: "food", amount: 100),
  Transactionmodel(date:DateTime.now(),transactiontype:"Expenses", category:"transport", amount: 50),
  Transactionmodel(date:DateTime.now(),transactiontype:"Expenses",category: "food", amount: 200), 
];


  Map<String, double> getDataMap() {
  Map<String, double> data = {};

  for (var tx in transactions) {
    if (data.containsKey(tx.category)) {
      data[tx.category] = data[tx.category]! + tx.amount;
    } else {
      data[tx.category] = tx.amount;
    }
  }

  return data;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("R E P O R T S",style:TextStyle(color:Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body:Center(
        child:PieChart(
          dataMap: getDataMap(),
          chartType:ChartType.ring,
          chartRadius:MediaQuery.of(context).size.width/2.2,
          legendOptions:LegendOptions(
            showLegends: true,
            legendPosition: LegendPosition.right,

          ),
          chartValuesOptions: ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: true
          ),

          )
      )
    );
  }
}