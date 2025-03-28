import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/action_button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payments')),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.padding),
        children: [
          _buildPaymentCard(context, 'Maintenance Fee', '₹5000', 'Due: 31 Mar 2025'),
          _buildPaymentCard(context, 'Electricity Bill', '₹1200', 'Due: 28 Mar 2025'),
        ],
      ),
    );
  }

  Widget _buildPaymentCard(BuildContext context, String title, String amount, String dueDate) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.cardRadius)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(amount, style: const TextStyle(fontSize: 18, color: AppColors.blue)),
            const SizedBox(height: 4),
            Text(dueDate, style: const TextStyle(color: AppColors.grey)),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ActionButton(
                text: 'Pay Now',
                onPressed: () => _showSnackBar(context, 'Payment initiated for $title'),
              ),
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