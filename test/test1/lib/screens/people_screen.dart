import 'package:flutter/material.dart';
import '../models/user_model.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('People', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: dummyUsers.length,
        itemBuilder: (context, index) {
          final user = dummyUsers[index];
          return ListTile(
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(user.avatarUrl),
                ),
                if (user.isOnline)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  )
              ],
            ),
            title: Text(
              user.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.front_hand, color: Colors.blue), // Đã sửa icon hợp lệ ở đây
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }
}