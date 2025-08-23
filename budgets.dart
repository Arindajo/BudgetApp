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
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Good spending Habits eqauls more Savings"),
            SizedBox(height:15),


            //user enters amount
            TextField(
              decoration:InputDecoration(
                hintText:"Enter your Budget Amount",
                border:OutlineInputBorder()

              ),
              keyboardType:TextInputType.number
            ),
          //button
          ElevatedButton(
           
            child: Text("Set Budget"),
            onPressed:(){},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple
          )),
        ],),
      )
    );
  }
}