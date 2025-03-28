import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/action_button.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deliveries')),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.padding),
        children: [
          _buildDeliveryCard(context, 'Amazon Package', 'BlueDart'),
          _buildDeliveryCard(context, 'Food Order', 'Swiggy'),
        ],
      ),
    );
  }

  Widget _buildDeliveryCard(BuildContext context, String item, String courier) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.cardRadius)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('Courier: $courier', style: const TextStyle(color: AppColors.grey)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ActionButton(
                  text: 'Collect',
                  onPressed: () => _showSnackBar(context, '$item collected at gate'),
                ),
                const SizedBox(width: 8),
                ActionButton(
                  text: 'Deliver',
                  onPressed: () => _showSnackBar(context, '$item delivered to door'),
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