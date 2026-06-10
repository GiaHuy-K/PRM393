import 'package:flutter/material.dart';

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 1 – Core Widgets'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 1. Headline Text
            const Text(
              'Welcome to Flutter UI',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // 2. Material Icon
            const Icon(
              Icons.movie,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),

            // 3. Image from Network
            Image.network(
              'https://picsum.photos/400/250',
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
            ),
            const SizedBox(height: 20),

            // 4. Card with ListTile inside
            const Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.star, color: Colors.grey),
                title: Text('Movie Item'),
                subtitle: Text('This is a sample ListTile inside a Card.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}