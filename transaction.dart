import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'transactionmodel.dart';

class AddTransaction extends StatefulWidget {
 

  @override
  State<AddTransaction> createState() => _TransactionState();
}

class _TransactionState extends State<AddTransaction> {
 // to get access to what the user typed
 TextEditingController myAmountController = TextEditingController();
 TextEditingController notesController = TextEditingController();

//this variable keeps track of what the user selects
 String transactiontype = "Income";//this is the default

 //defining a list of categories
 List<String>expensecategories  = ["Food","Transport","Clothes","Groceries","Rent"];
 List<String>incomecategories =["salary","gig","side buisness","financial support"];

 //a variable to hold the selected Category
 String?selectedcategory;

 //a variable to hold the selected date
 DateTime selectedDate =DateTime.now();

 void _save(){
  //reading values from state variables and controllers
  String amountText = myAmountController.text;
  String notesText = notesController.text;
  String transactionType = transactiontype;
  String selectedCategory = selectedcategory ?? "Uncategorized";
  DateTime date = selectedDate;


//simple validation
 if (amountText.isEmpty) {
    print("Please enter an amount");
    return;
  }

  double amount = double.tryParse(amountText) ?? 0;

  // 3. Print values to console (for now)
  print("Transaction Saved:");
  print("Amount: $amount");
  print("Type: $transactiontype");
  print("Category: $selectedcategory");
  print("Date: $date");
  print("Notes: $notesText");

 }
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
                title:Expanded(child: Text("Income")),
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
            title:Expanded(child: Text("Expenses")),
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

             // Category Dropdown
              DropdownButton<String>(
                value: selectedcategory,
                hint: Text("Select Category"),
                onChanged: (value) {
                  setState(() {
                    selectedcategory = value;
                  });
                },
                items: (transactiontype == "Income" ? incomecategories : expensecategories)
      .map((cat) => DropdownMenuItem(
            value: cat,
            child: Text(cat),
          ))
      .toList(),
),
              
              SizedBox(height: 20),
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
                  SizedBox(height:20),
                ElevatedButton(
            onPressed:(){
              final text = myAmountController.text.trim();
              final amount = double.tryParse(text);
              if (amount == null||amount<=0){
                 ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Enter a valid amount")),
                 );
                 return;
              }
              final tx =Transactionmodel(
                amount:amount,
                transactiontype:transactiontype,
                category:selectedcategory ?? "other", 
                date:selectedDate,
                notes:notesController.text.trim().isEmpty ? null:notesController.text.trim(),






              );
              Navigator.pop(context,tx);
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