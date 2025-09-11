import 'package:flutter/material.dart';

class SharedBudgetForm extends StatefulWidget {
  const SharedBudgetForm({super.key});

  @override
  State<SharedBudgetForm> createState() => _SharedBudgetFormState();
}

class _SharedBudgetFormState extends State<SharedBudgetForm> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _participantsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Budget"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Budget Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter Budget Amount",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _participantsController,
              decoration: const InputDecoration(
                labelText: "Enter Participants (comma separated emails)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              onPressed: () {
                final value = double.tryParse(_amountController.text.trim());
                if (value == null || value <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Enter a valid amount")),
                  );
                  return;
                }

                final data = {
                  "name": _nameController.text.trim(),
                  "amount": value,
                  "participants": _participantsController.text.trim().split(","),
                };

                Navigator.pop(context, data); // return shared budget details
              },
              child: const Text("Save", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
