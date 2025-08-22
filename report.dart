import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'transactionmodel.dart';
import 'dashboard.dart';
import 'navbar.dart';

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

    for (var t in widget.transactions) {
      dataMap[t.category] = (dataMap[t.category] ?? 0) + t.amount;
    }
    return Scaffold(
      appBar:AppBar(
        title:Text("R E P O R T S",style:TextStyle(color:Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body:Center(
        child:PieChart(
          dataMap: dataMap,
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