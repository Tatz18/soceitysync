import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Community')),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.padding),
        children: [
          _buildPostCard(context, 'Amit', 'Holi celebration tomorrow at 5 PM!'),
          _buildPostCard(context, 'Priya', 'Lost a blue umbrella near gate.'),
        ],
      ),
    );
  }

  Widget _buildPostCard(BuildContext context, String user, String message) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.cardRadius)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(message, style: const TextStyle(color: AppColors.grey)),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(icon: const Icon(Icons.thumb_up, size: 20), onPressed: () {}),
                IconButton(icon: const Icon(Icons.comment, size: 20), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}