import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/action_button.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Services')),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.padding),
        children: [
          _buildServiceCard(context, 'Plumbing', '₹500'),
          _buildServiceCard(context, 'Cleaning', '₹800'),
        ],
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, String service, String price) {
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
                Text(service, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(price, style: const TextStyle(color: AppColors.blue)),
              ],
            ),
            ActionButton(
              text: 'Request',
              onPressed: () => _showSnackBar(context, '$service requested'),
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