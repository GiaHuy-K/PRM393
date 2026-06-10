import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger Clone',
      debugShowCheckedModeBanner: false, // Tắt cái nhãn debug màu đỏ góc phải
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}