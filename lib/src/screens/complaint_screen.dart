import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complaints')),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.padding),
        children: [
          _buildComplaintCard(context, 'Leaking Pipe', 'Pending', Colors.orange),
          _buildComplaintCard(context, 'Power Outage', 'Resolved', Colors.green),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showSnackBar(context, 'New complaint registered'),
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildComplaintCard(BuildContext context, String issue, String status, Color statusColor) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.cardRadius)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(issue, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Reported: 23 Mar 2025', style: const TextStyle(color: AppColors.grey)),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(status, style: TextStyle(color: statusColor)),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}