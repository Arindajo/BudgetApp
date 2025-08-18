import 'package:flutter/material.dart';

class Transaction extends StatefulWidget {
 

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.purple,
        title: Text("Add Transaction"),
      ),
      body:Form(
        child: Column(children: [
        TextField(
          decoration:InputDecoration(
            labelText:"Amount",
            border:OutlineInputBorder()
          ),
          
        )
        ],),
      )
    );
  }
}