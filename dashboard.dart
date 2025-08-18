import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.purple,
        title:Text("D A S H B O A R D",style:TextStyle(fontSize:20,color:Colors.white))
      ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(children: [
           Text("Current Balance",style:TextStyle(fontSize:25,fontWeight:FontWeight.bold,color:Colors.purple)),
            
           
             Row(
                children: [
                  Expanded(child: Text("Income :10,000UGX",style:TextStyle(fontSize:18,fontWeight:FontWeight.bold))),
                  
                  Expanded(child: Text("Expenses: 6000UGX",style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)))
                ],
              ),
            
            Container(
              child: Text('Spending Chart'),
              width:200,
              height:200,
              color: Colors.purple,
          
              ),SizedBox(height:25),
              ElevatedButton(
                child:Text("Add Transaction",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20)),
               
               onPressed:(){}
              )
            
          ],),
        ),
      )
    );
  }
}