import 'package:flutter/material.dart';
import '../utils/constants.dart';

class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({super.key});

  @override
  _GroupChatScreenState createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [
    {'user': 'Amit', 'text': 'Hi everyone, meeting at 6 PM!'},
    {'user': 'Priya', 'text': 'Thanks for the update!'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Group Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(AppSizes.padding),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessageTile(_messages[index]);
              },
            ),
          ),
          _buildMessageInput(context),
        ],
      ),
    );
  }

  Widget _buildMessageTile(Map<String, String> message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.blue,
            child: Text(message['user']![0], style: const TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message['user']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 4)],
                  ),
                  child: Text(message['text']!),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.padding),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.send, color: AppColors.blue),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add({'user': 'You', 'text': _messageController.text});
        _messageController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Message sent!')));
    }
  }
}