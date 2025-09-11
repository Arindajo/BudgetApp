import 'package:flutter/material.dart';

class PersonalBudgetForm extends StatefulWidget {
  const PersonalBudgetForm({super.key});

  @override
  State<PersonalBudgetForm> createState() => _PersonalBudgetFormState();
}

class _PersonalBudgetFormState extends State<PersonalBudgetForm> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Personal Budget", style:TextStyle(color:Colors.white)),
        backgroundColor:Colors.purple
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter Budget Amount",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              onPressed: () {
                final value = double.tryParse(_controller.text.trim());
                if (value == null || value <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Enter a valid budget")),
                  );
                  return;
                }
                Navigator.pop(context, value); // ✅ return budget to previous screen
              },
              child: const Text("Save", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
    







