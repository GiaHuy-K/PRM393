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
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage(user.avatarUrl),
        ),
        title: Text(
          user.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          user.lastMessage ?? "",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          user.lastMessageTime ?? "",
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ),
    );
  }
}