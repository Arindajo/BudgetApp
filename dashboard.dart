import 'package:budget_app/transactionmodel.dart';
import 'package:flutter/material.dart';
import 'transaction.dart';
import 'report.dart';

class Dashboard extends StatefulWidget {
    final List<Transactionmodel> transactions;
  final Function(Transactionmodel) onAddTransaction;

  Dashboard({required this.transactions, required this.onAddTransaction});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  double get totalIncome => widget.transactions
    .where((t) => t.transactiontype == "Income").fold(0.0, (sum, t) => sum + t.amount);

double get totalExpense => widget.transactions
    .where((t) => t.transactiontype == "Expenses").fold(0.0, (sum, t) => sum + t.amount);

double get balance => totalIncome - totalExpense;




    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.purple,
        title:Text("D A S H B O A R D",style:TextStyle(fontSize:20,color:Colors.white)),
  
      ),
           
      
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(children: [
             Text("Current Balance: ${balance.toStringAsFixed(0)} UGX"),SizedBox(height:25),
            Row(
              children: [
                Expanded(child: Text("Income: ${totalIncome.toStringAsFixed(0)} UGX")),
                SizedBox(width: 25),
                Expanded(child: Text("Expenses: ${totalExpense.toStringAsFixed(0)} UGX")),
              ],
            ),
            
              
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  child: Text('Spending Chart'),
                  width:200,
                  height:200,
                  color: Colors.purple,
                          
                  ),
              ),SizedBox(height:25),
                ElevatedButton(
                  child:Text("Add Transaction",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20)),
                 
                onPressed: () async {
              final tx = await Navigator.push<Transactionmodel>(
                context,
                MaterialPageRoute(builder: (_) => AddTransaction()),
              );
            
              if (tx != null) {
               widget.onAddTransaction(tx);
              }
            }
                )
              
            ],),
          ),
        ),
      )
    );
  }
}