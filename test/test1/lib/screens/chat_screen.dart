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
  List<UserModel> _filteredUsers = [];
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _filteredUsers = dummyUsers;
  }

  void _filterUsers(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredUsers = dummyUsers;
      } else {
        _filteredUsers = dummyUsers
            .where((user) => user.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Chỉ hiển thị online những người khớp với từ khóa search
    final onlineUsers = _filteredUsers.where((user) => user.isOnline).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://picsum.photos/id/237/150/150"),
          ),
        ),
        title: const Text(
          'Chats',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: const Icon(Icons.camera_alt, color: Colors.black, size: 20),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: const Icon(Icons.edit, color: Colors.black, size: 20),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Ô Search nâng cấp UI
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  onChanged: _filterUsers,
                  decoration: const InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 8),
                  ),
                ),
              ),
            ),

            // 2. Thanh Stories hàng ngang (Có nút Your Story)
            if (onlineUsers.isNotEmpty || _searchQuery.isEmpty)
              SizedBox(
                height: 105,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: onlineUsers.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return _buildYourStory();
                    }
                    return ActiveUserItem(user: onlineUsers[index - 1]);
                  },
                ),
              ),

            // 3. Danh sách cuộc hội thoại hàng dọc
            _filteredUsers.isEmpty
                ? const Center(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Text(
                  "No results found",
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

  Widget _buildYourStory() {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[100],
            child: const Icon(Icons.add, size: 28, color: Colors.black),
          ),
          const SizedBox(height: 8),
          const Text(
            "Your Story",
            style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}