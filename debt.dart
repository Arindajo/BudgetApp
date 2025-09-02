import 'package:flutter/material.dart';

class Debt extends StatefulWidget {
  @override
  State<Debt> createState() => _DebtState();
}

class _DebtState extends State<Debt> {
  List<String> DebtOption=[
    "Debtor","Creditor"
  ];
  List<Map<String, dynamic>> Debts =[];
bool showForm = false;
 String? selectedOption;
TextEditingController namecontroller = TextEditingController();
TextEditingController debtamountcontroller =TextEditingController();
TextEditingController infocontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:showForm ? buildDebtForm() : buildDebtList(),
      //floating action button
         floatingActionButton:FloatingActionButton(
              onPressed:(){
                setState((){
                  showForm =!showForm;
                });
               
              },
               child:Icon(Icons.add,size:40,color:Colors.purple)),
           
      
    );
  }

    Widget  buildDebtList(){
      if (Debts.isEmpty){
        return Center(child:Text("No debts added yet",style:TextStyle(fontStyle:FontStyle.italic)));
      }
      return ListView.builder(
        itemCount:Debts.length,
        itemBuilder:(context,index){
          final debt = Debts[index];
          return ListTile(
             title: Text("${debt['name']} - ${debt['amount']}"),
        subtitle: Text("${debt['type']} • ${debt['info']}"),
          );
        }
      );
    }
    


Widget buildDebtForm(){
     return Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
             backgroundImage: AssetImage("assets/images/logo.jpeg"),
             radius:40
            ),
            Text("Borrowings and Lendings",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold)),
         
            if(showForm)
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
              controller:debtamountcontroller ,
              decoration:InputDecoration(
                labelText:"Debt Amount",
                hintText:"Enter Amount",
                border:OutlineInputBorder()
              )
            ),
            SizedBox(height:15),
              TextField(
                controller: namecontroller,
              decoration:InputDecoration(
                labelText:"Name",
                hintText:"Enter Name",
                border:OutlineInputBorder()
              )
            ),
            SizedBox(height:15),
              TextField(
                controller: infocontroller,
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
            ),
        

        
         ])
     );
      
} 
  
}
