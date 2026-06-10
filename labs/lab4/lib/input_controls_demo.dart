import 'package:flutter/material.dart';

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double _sliderValue = 50.0;
  bool _isMovieActive = false;
  String _selectedGenre = 'None';
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 2 – Input Controls'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Rating Slider
            const Text('Rating (Slider)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              divisions: 100,
              label: _sliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            Text('Current value: ${_sliderValue.round()}'),
            const SizedBox(height: 24),

            // 2. Active Switch
            const Text('Active (Switch)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Is movie active?'),
                Switch(
                  value: _isMovieActive,
                  onChanged: (bool value) {
                    setState(() {
                      _isMovieActive = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 3. Genre RadioListTile
            const Text('Genre (RadioListTile)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            RadioListTile<String>(
              title: const Text('Action'),
              value: 'Action',
              groupValue: _selectedGenre,
              onChanged: (String? value) {
                setState(() {
                  _selectedGenre = value ?? 'None';
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Comedy'),
              value: 'Comedy',
              groupValue: _selectedGenre,
              onChanged: (String? value) {
                setState(() {
                  _selectedGenre = value ?? 'None';
                });
              },
            ),
            Text('Selected genre: $_selectedGenre'),
            const SizedBox(height: 24),

            // 4. Date Picker Button
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                    });
                  }
                },
                child: const Text('Open Date Picker'),
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                _selectedDate == null
                    ? 'No date selected'
                    : 'Selected date: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}