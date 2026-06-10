import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ConversationItem extends StatelessWidget {
  final UserModel user;

  const ConversationItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage(user.avatarUrl),
        ),
        title: Text(
          user.name,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: Text(
                user.lastMessage ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ),
            Text(
              " • ${user.lastMessageTime}",
              style: TextStyle(color: Colors.grey[500], fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}