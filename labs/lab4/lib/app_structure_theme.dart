import 'package:flutter/material.dart';

class AppStructureThemeDemo extends StatefulWidget {
  const AppStructureThemeDemo({super.key});

  @override
  State<AppStructureThemeDemo> createState() => _AppStructureThemeDemoState();
}

class _AppStructureThemeDemoState extends State<AppStructureThemeDemo> {
  // Biến lưu trạng thái Chế độ tối (Dark Mode) - ban đầu là tắt (false)
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    // Tự định nghĩa ThemeData cho Chế độ sáng và Chế độ tối theo yêu cầu
    final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: const Color(0xFFF8F7FA), // Màu nền sáng nhạt giống ảnh mẫu
    );

    final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
    );

    // Sử dụng Theme để bọc ngoài màn hình này, giúp cập nhật giao diện khi đổi trạng thái
    return Theme(
      data: _isDarkMode ? darkTheme : lightTheme,
      child: Scaffold(
        // 1. Thành phần AppBar (Thanh ứng dụng)
        appBar: AppBar(
          title: const Text('Exercise 4 – App Str...'),
          actions: [
            // Dòng hiển thị chữ "Dark" và nút gạt Switch ở góc phải AppBar giống ảnh mẫu
            Row(
              children: [
                const Text('Dark', style: TextStyle(fontSize: 16)),
                Switch(
                  value: _isDarkMode,
                  onChanged: (bool value) {
                    setState(() {
                      _isDarkMode = value; // Bật hoặc tắt Dark Mode
                    });
                  },
                ),
              ],
            ),
          ],
        ),

        // 2. Thành phần Body (Thân trang)
        body: Center(
          child: Text(
            'This is a simple screen with theme toggle.',
            style: TextStyle(
              fontSize: 18,
              // Chữ tự động đổi màu cho phù hợp với nền sáng/tối
              color: _isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
        ),

        // 3. Thành phần FloatingActionButton (Nút bấm hành động nổi)
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Thông báo ngắn khi bấm nút nổi
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('FloatingActionButton Tapped!')),
            );
          },
          child: const Icon(Icons.add), // Biểu tượng dấu cộng inside nút nổi
        ),
      ),
    );
  }
}