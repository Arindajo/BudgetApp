import 'package:flutter/material.dart';
import 'transactionmodel.dart';
import 'util/personalbudget.dart';
import 'util/shared.dart';
class Budget extends StatefulWidget {
    final List<Transactionmodel> transactions;
  final double? currentBudget;

  const Budget({super.key, this.currentBudget, required this.transactions});

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  double? totalBudget;
  double get totalSpent {
  return widget.transactions
      .where((t) => t.transactiontype == "Expenses")
      .fold(0.0, (sum, t) => sum + t.amount);
}

  TextEditingController budgetController = TextEditingController();

  @override
  void initState() {
    super.initState();
    totalBudget = widget.currentBudget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("B U D G E T S", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: totalBudget == null ? buildAddBudget() : buildBudgetSummary(),
        ),
      ),
    );
  }

  Widget buildAddBudget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Good spending habits equals more savings",
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        TextField(
          controller: budgetController,
          decoration: const InputDecoration(
            hintText: "Enter your Budget Amount",
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
          onPressed: () {
            showModalBottomSheet(
              context:context,
              builder:(context){
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Icon(Icons.person, color:Colors.purple),
                      title:Text("Personal Budget"),
                      subtitle: Text("Track your personal expenses",style:TextStyle(fontStyle:FontStyle.italic)),
                      onTap:(){
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>PersonalBudgetForm())
                          
                          
                          );
                      }
                    ),
                    ListTile(
                      leading:Icon(Icons.group,color:Colors.purple),
                      title:Text("Shared Budget"),
                      subtitle: Text("Share budget with Friends and family",style:TextStyle(fontStyle:FontStyle.italic)),
                      onTap:(){
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder:(context)=>SharedBudgetForm())
                        );
                      },

                    )

                ],);
              }
            );
            
            
          },
          child: const Text("Set Budget",style:TextStyle(color:Colors.white)),
        ),
      ],
    );
  }

  Widget buildBudgetSummary() {
    double remaining = totalBudget! - totalSpent;
    double progress = (totalSpent / totalBudget!).clamp(0, 1);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Total Budget: ${totalBudget!.toStringAsFixed(0)}"),
        Text("Total Spent: ${totalSpent.toStringAsFixed(0)}"),
        Text("Remaining: ${remaining.toStringAsFixed(0)}"),
        const SizedBox(height: 15),
        LinearProgressIndicator(
          value: progress,
          minHeight: 20,
          backgroundColor: Colors.grey[300],
          color: Colors.purple,
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
          onPressed: showEditBudgetDialog,
          child: const Text("Edit Budget",style:TextStyle(color:Colors.white)),
        ),
      ],
    );
  }

  void showEditBudgetDialog() {
    budgetController.text = totalBudget!.toStringAsFixed(0);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Budget"),
          content: TextField(
            controller: budgetController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                final value = double.tryParse(budgetController.text);
                if (value != null && value > 0) {
                  setState(() {
                    totalBudget = value;
                    budgetController.clear();
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
