import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ChildSafetyScreen extends StatelessWidget {
  const ChildSafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Child Safety')),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.padding),
        children: [
          _buildAlertCard(context, 'Rohan left at 3:00 PM'),
          _buildAlertCard(context, 'Sneha returned at 2:45 PM'),
        ],
      ),
    );
  }

  Widget _buildAlertCard(BuildContext context, String message) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.cardRadius)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const Icon(Icons.child_care, color: AppColors.blue),
            const SizedBox(width: 12),
            Text(message, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}