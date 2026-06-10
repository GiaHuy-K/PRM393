import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'people_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Danh sách các màn hình ứng với từng Tab
  final List<Widget> _screens = [
    const ChatScreen(),
    const PeopleScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Thay đổi tab khi tap
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "People",
          ),
        ],
      ),
    );
  }
}