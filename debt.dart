import 'package:flutter/material.dart';

class Debt extends StatefulWidget {
  @override
  State<Debt> createState() => _DebtState();
}

class _DebtState extends State<Debt> {
  List<String> DebtOption=[
    "Debtor","Creditor"
  ];

 String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
             DropdownButtonFormField<String>(
             value:selectedOption,
             hint:Text("Select type"),
             items:DebtOption.map((String option){
              return DropdownMenuItem<String>(
               value:option,
               child:Text(option)
              );
             }).toList(),

             onChanged: (value){
              setState((){
               selectedOption=value!;
              });
             },
             decoration: InputDecoration(
              border:OutlineInputBorder(),
              label:Text("Debt Type")
             ),
             
              
              
              
              
              ),
            SizedBox(height:15),
            TextField(
              decoration:InputDecoration(
                labelText:"Debt Amount",
                hintText:"Enter Amount",
                border:OutlineInputBorder()
              )
            ),
            SizedBox(height:15),
              TextField(
              decoration:InputDecoration(
                labelText:"Name",
                hintText:"Enter Name",
                border:OutlineInputBorder()
              )
            ),
            SizedBox(height:15),
              TextField(
              decoration:InputDecoration(
                labelText:"Information",
                hintText:"Enter details",
                border:OutlineInputBorder()
              )
            ),
            SizedBox(height:15),
            Row(
              children:[
            ElevatedButton(
              child:Text("Edit"),
              onPressed: (){}, 
              
            ),SizedBox(width:100),
            ElevatedButton(
              child:Text("Save"),
              onPressed: (){}, 
              
            )
              ]
            )
          ],
        ),
      )
    );
  }
}