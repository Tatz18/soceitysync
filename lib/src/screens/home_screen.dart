import 'package:flutter/material.dart';
import 'package:societysync/src/utils/constants.dart';
import '../screens/visitor_screen.dart';
import '../screens/delivery_screen.dart';
import '../screens/child_safety_screen.dart';
import '../screens/emergency_screen.dart';
import '../screens/booking_screen.dart';
import '../screens/payment_screen.dart';
import '../screens/complaint_screen.dart';
import '../screens/community_screen.dart';
import '../screens/services_screen.dart';
import '../widgets/feature_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final int crossAxisCount = screenWidth > 600 ? 3 : 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SocietySync'),
        actions: [IconButton(icon: const Icon(Icons.person), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: GridView.count(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            FeatureCard(title: 'Visitors', icon: Icons.person, onTap: () => _navigate(context, const VisitorScreen())),
            FeatureCard(title: 'Deliveries', icon: Icons.delivery_dining, onTap: () => _navigate(context, const DeliveryScreen())),
            FeatureCard(title: 'Child Safety', icon: Icons.child_care, onTap: () => _navigate(context, const ChildSafetyScreen())),
            FeatureCard(title: 'Emergency', icon: Icons.warning, onTap: () => _navigate(context, const EmergencyScreen())),
            FeatureCard(title: 'Bookings', icon: Icons.event, onTap: () => _navigate(context, const BookingScreen())),
            FeatureCard(title: 'Payments', icon: Icons.payment, onTap: () => _navigate(context, const PaymentScreen())),
            FeatureCard(title: 'Complaints', icon: Icons.report, onTap: () => _navigate(context, const ComplaintScreen())),
            FeatureCard(title: 'Community', icon: Icons.group, onTap: () => _navigate(context, const CommunityScreen())),
            FeatureCard(title: 'Services', icon: Icons.build, onTap: () => _navigate(context, const ServicesScreen())),
          ],
        ),
      ),
    );
  }

  void _navigate(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }
}