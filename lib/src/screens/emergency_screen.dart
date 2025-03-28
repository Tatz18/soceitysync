import 'package:flutter/material.dart';


class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double buttonSize = screenWidth > 600 ? 150.0 : 120.0;

    return Scaffold(
      appBar: AppBar(title: const Text('Emergency')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showSnackBar(context, 'Emergency alert sent!'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.all(buttonSize / 3),
            shape: const CircleBorder(),
          ),
          child: Text(
            'SOS',
            style: TextStyle(fontSize: buttonSize / 4, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}