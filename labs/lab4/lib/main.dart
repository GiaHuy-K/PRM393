import 'package:flutter/material.dart';
import 'core_widgets_demo.dart';
import 'input_controls_demo.dart';
import 'layout_basics_demo.dart';
import 'app_structure_theme.dart';
import 'common_ui_fixes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 4 Flutter UI',
      // Thiết lập chủ đề chung cho toàn bộ ứng dụng
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, // Sử dụng giao diện Material 3 hiện đại
      ),
      home: const Lab4MainMenu(),
    );
  }
}

// Tạo màn hình Menu chính
class Lab4MainMenu extends StatelessWidget {
  const Lab4MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // Danh sách tên 5 bài tập để hiển thị lên vòng lặp cho code ngắn gọn
    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'Exercise 1 – Core Widgets Demo',
        'subtitle': 'Text, Image, Icon, Card, ListTile',
        'page': const CoreWidgetsDemo(),
        'icon': Icons.widgets,
      },
      {
        'title': 'Exercise 2 – Input Controls Demo',
        'subtitle': 'Slider, Switch, RadioListTile, DatePicker',
        'page': const InputControlsDemo(),
        'icon': Icons.input,
      },
      {
        'title': 'Exercise 3 – Layout Basics Demo',
        'subtitle': 'Column, Row, Padding, ListView',
        'page': const LayoutBasicsDemo(),
        'icon': Icons.layers,
      },
      {
        'title': 'Exercise 4 – App Structure & Theme',
        'subtitle': 'Scaffold, AppBar, FAB & Dark Mode',
        'page': const AppStructureThemeDemo(),
        'icon': Icons.palette,
      },
      {
        'title': 'Exercise 5 – Common UI Fixes',
        'subtitle': 'Debug & Fix Layout Errors',
        'page': const CommonUiFixesDemo(),
        'icon': Icons.bug_report,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4 – Flutter UI Fundamentals'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.withOpacity(0.1),
                  child: Icon(item['icon'], color: Colors.blue),
                ),
                title: Text(
                  item['title'],
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Text(
                  item['subtitle'],
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                // Sự kiện khi ấn vào từng dòng: chuyển sang trang bài tập tương ứng
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => item['page']),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}