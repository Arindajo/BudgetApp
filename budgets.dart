import 'package:flutter/material.dart';

class Budget extends StatelessWidget {
  const Budget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("B U D G E T S",style: TextStyle(color:Colors.white),),
        backgroundColor:Colors.purple
      ),
      body:Column(children: [
        //button
        ElevatedButton(
          child: Text("Set Budget"),
          onPressed:(){}
        )
      ],)
    );
  }
}