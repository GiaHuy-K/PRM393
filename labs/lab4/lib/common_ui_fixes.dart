import 'package:flutter/material.dart';

class CommonUiFixesDemo extends StatefulWidget {
  const CommonUiFixesDemo({super.key});

  @override
  State<CommonUiFixesDemo> createState() => _CommonUiFixesDemoState();
}

class _CommonUiFixesDemoState extends State<CommonUiFixesDemo> {
  int _counter = 0;
  DateTime? _selectedDate;

  final List<String> movies = ['Movie A', 'Movie B', 'Movie C', 'Movie D'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 5 – Common UI...'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Correct ListView inside Column using Expanded',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.movie),
                    title: Text(movies[index]),
                  );
                },
              ),
            ),

            const Divider(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Counter Value: $_counter', style: const TextStyle(fontSize: 16)),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter++;
                    });
                  },
                  child: const Text('Increment'),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    setState(() {
                      _selectedDate = picked;
                    });
                  }
                },
                child: const Text('Select Date'),
              ),
            ),
            if (_selectedDate != null)
              Center(
                child: Text('Selected: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'),
              ),
          ],
        ),
      ),
    );
  }
}