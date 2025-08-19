import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Transaction extends StatefulWidget {
 

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
 // to get access to what the user typed
 TextEditingController myAmountController = TextEditingController();
 TextEditingController notesController = TextEditingController();

//this variable keeps track of what the user selects
 String transactiontype = "Income";//this is the default

 //defining a list of categories
 List<String>categories  = ["Food","Transport","Clothes","Groceries",
 "Rent"];

 //a variable to hold the selected Category
 String?selectedcategory;

 //a variable to hold the selected date
 DateTime selectedDate =DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.purple,
        title: Text("A D D  T R A N S A C T I O N ",style:TextStyle(fontWeight:FontWeight.bold, color:Colors.white)),
      ),
      body:SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
            Column(
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  controller: myAmountController,
                  decoration:InputDecoration(
                    labelText:"Amount",
                    hintText:"Enter Amount",
                   
                    border:OutlineInputBorder()
                  ),
                  
                ),
            
           Column(
             children: [
               RadioListTile(
                title:Text("Income"),
                value:"Income",
                groupValue:transactiontype,
                onChanged:(value){
                  setState((){
                    transactiontype=value.toString();
                  });
               
                }
               ),
             ],
           ),
           RadioListTile(
            title:Text("Expense"),
            groupValue:transactiontype,
            value:"Expenses",
            onChanged:(value){
              setState(
                (){
                 transactiontype = value.toString();
                }
              );
            }
           )
              
              ],
            ),
            Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text("Date: ${selectedDate.toLocal().toString().split(' ')[0]}",style:TextStyle(fontWeight:FontWeight.bold)),
                  onPressed:()async {
                    DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,       // default is current selected
                    firstDate: DateTime(2000),       // earliest allowed date
                    lastDate: DateTime(2100),        // latest allowed date
                  );
                
                  if (picked != null && picked != selectedDate) {
                    setState(() {
                      selectedDate = picked;
                    });
                  }
                },
                  
                
                ),
                TextField(
                  controller: notesController,
                  decoration:InputDecoration(
                    labelText:"Notes",
                    border:OutlineInputBorder(borderRadius:BorderRadius.circular(20))
                  ),
                

                ),
                  Spacer(),
                ElevatedButton(
            onPressed: () {
              // Collect values
              String amount = myAmountController.text;
              String notes = notesController.text;
              String type = transactiontype;
              String category = selectedcategory ?? "No Category";
              String date = selectedDate.toLocal().toString().split(' ')[0];

              // For now: print to console
              print("Amount: $amount");
              print("Notes: $notes");
              print("Type: $type");
              print("Category: $category");
              print("Date: $date");
            },
            child: Text("S A V E"),
          ),
              ],
            ),
            ],),
          ),
        ),
      )
    );
  }
}