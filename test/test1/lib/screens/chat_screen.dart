import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../widgets/active_user_item.dart';
import '../widgets/conversation_item.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Biến lưu trữ danh sách hiển thị sau khi đã lọc
  List<UserModel> _filteredUsers = [];
  // Biến lưu trữ nội dung người dùng gõ vào ô search
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    // Ban đầu chưa search gì thì hiển thị toàn bộ danh sách
    _filteredUsers = dummyUsers;
  }

  // Hàm xử lý logic lọc dữ liệu
  void _filterUsers(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredUsers = dummyUsers;
      } else {
        // Lọc không phân biệt chữ hoa chữ thường (toLowerCase)
        _filteredUsers = dummyUsers
            .where((user) => user.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Thanh hàng ngang chỉ hiển thị những người đang online VÀ khớp với từ khóa tìm kiếm
    final onlineUsers = _filteredUsers.where((user) => user.isOnline).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Chats', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Khung Search (Đã thêm logic xử lý)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  onChanged: (value) => _filterUsers(value), // Gọi hàm lọc mỗi khi gõ chữ
                  decoration: const InputDecoration(
                    hintText: "Tìm kiếm",
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // 2. Danh sách hàng ngang (Gợi ý/Online) - Tự động thu hẹp theo bộ lọc
            if (onlineUsers.isNotEmpty) ...[
              SizedBox(
                height: 100,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: onlineUsers.length,
                  itemBuilder: (context, index) {
                    return ActiveUserItem(user: onlineUsers[index]);
                  },
                ),
              ),
            ],

            // 3. Danh sách các liên hệ đã chat (Hàng dọc) - Đã được lọc
            _filteredUsers.isEmpty
                ? const Center(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Text(
                  "Không tìm thấy kết quả phù hợp",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            )
                : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _filteredUsers.length,
              itemBuilder: (context, index) {
                return ConversationItem(user: _filteredUsers[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}