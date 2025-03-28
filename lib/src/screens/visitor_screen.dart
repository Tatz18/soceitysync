import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/action_button.dart';

class VisitorScreen extends StatelessWidget {
  const VisitorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Visitors')),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.padding),
        children: [
          _buildVisitorCard(context, 'Amit Das', 'Guest Visit'),
          _buildVisitorCard(context, 'Priya Sen', 'Service'),
        ],
      ),
    );
  }

  Widget _buildVisitorCard(BuildContext context, String name, String purpose) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.cardRadius)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('Purpose: $purpose', style: const TextStyle(color: AppColors.grey)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ActionButton(
                  text: 'Approve',
                  onPressed: () => _showSnackBar(context, '$name approved'),
                ),
                const SizedBox(width: 8),
                ActionButton(
                  text: 'Reject',
                  onPressed: () => _showSnackBar(context, '$name rejected'),
                  color: Colors.red,
                ),
              ],
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